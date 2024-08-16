import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dont_book_my_show/admin_dashboard.dart';
import 'package:dont_book_my_show/auth_token.dart';
import 'package:dont_book_my_show/homescreen.dart';
import 'package:dont_book_my_show/registration.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/batman.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: ''),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'email',
                            label: Text('email'),
                            prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.email_rounded)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                            fillColor: Color(0xffD8D8DD),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: passwordController,
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                            hintText: 'password',
                            label: const Text('Password'),
                            fillColor: const Color(0xffD8D8DD),
                            filled: true,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.key),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(!_passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 19, top: 8, right: 19),
                        child: Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () => Get.to(() => RequestOTPScreen(
                                onRequestOTP: requestOTP,
                              )),
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
                        child: const Text('Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => myRegister())),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 115.0, top: 5),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                              Text(
                                "Signup",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void login(String email, String password) async {
    String url = "http://10.10.10.139/api/login";
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    log("${body}");
    Dio dio = Dio();
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      log('${response.data}');
     // log('${response.statusCode}');
      Map<String, dynamic> map = response.data;
      if(response.data['status']){
        AccessTokens.authToken= response.data['result'][0]['token'];
        log('${AccessTokens.authToken}');
        Get.to(HomePage1());
      }
      if (map['status']) {
         var role = map['result'][0]['role'];
        Fluttertoast.showToast(
            msg: "Sign in successful!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.white,
            textColor: Colors.black);
        if (role.contains('admin')) {
          Get.to(() => AdminDashboardPage());
        } else {
          Get.to(() => HomePage1());
        }
      } else {
        Fluttertoast.showToast(
          msg: "Can't Sign in",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    } catch (e) {
      log('[e] error occurs $e');
    }
  }

  void requestOTP(String email) async {
    String url = "http://10.10.10.139/api/forgot_password";
    var body = {
      'email': email,
    };
    log("${body}");
    Dio dio = Dio();
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      log('${response.data}');
      log('${response.statusCode}');
      Map map = response.data;
      if (map['status']) {
        Fluttertoast.showToast(
          msg: "OTP sent to your email!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        // Navigate to OTP verification screen
        Get.to(() => OTPVerificationScreen(email: email));
      } else {
        Fluttertoast.showToast(
          msg: "Failed to send OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    } catch (e) {
      log('[e] error occurs $e');
    }
  }
}



// Request OTP Screen
class RequestOTPScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final Function(String) onRequestOTP;

  RequestOTPScreen({required this.onRequestOTP});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter Registered Mail",style: TextStyle(color: Colors.white,fontSize: 25),),
SizedBox(height: 25,),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white, // Background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
              ),
            ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                onRequestOTP(emailController.text.trim());
              },
              child: Text('Request OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

// OTP Verification Screen
class OTPVerificationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final String email;

  OTPVerificationScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter the OTP sent to Mail",style: TextStyle(color: Colors.white,fontSize: 25),),
            SizedBox(height: 25,),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: otpController,
              decoration: InputDecoration(
                labelText: 'OTP',
                filled: true,
                fillColor: Colors.white, // Background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
              ),
            ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                verifyOTP(email, otpController.text.trim());
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }

  void verifyOTP(String email, String otp) async {
    String url = "http://10.10.10.139/api/verification_pw";
    var body = {
      'email': email,
      'otp': otp,
    };

    Dio dio = Dio();
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      Map map = response.data;
      if (map['status']) {
        Fluttertoast.showToast(
          msg: "OTP verified! Please set a new password.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white
        );
        // Navigate to password reset screen
        Get.to(() => PasswordResetScreen(email: email,otp: otp,));
      } else {
        Fluttertoast.showToast(
          msg: "Invalid OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    } catch (e) {
      log('[e] error occurs $e');
    }
  }
}

// Password Reset Screen
class PasswordResetScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final String email;
  final String otp;

  PasswordResetScreen({required this.email,required this.otp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter New password",style: TextStyle(color: Colors.white,fontSize: 25),),
            SizedBox(height: 25,),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
               filled: true,
               fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))

              ),
              obscureText: true,
            ),
            SizedBox(height: 15,),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                filled: true,
                fillColor: Colors.white, // Background color
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))
              ),
              obscureText: true,
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                resetPassword(
                  otp,
                  passwordController.text.trim(),
                  confirmPasswordController.text.trim(),
                  email,
                );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }

  void resetPassword(
      String otp,
       String new_password, String confirm_password,String email,) async {
    if (new_password != confirm_password) {
      Fluttertoast.showToast(
        msg: "Passwords do not match",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    log("here");

    String url = "http://10.10.10.139/api/reset_pw";
    var body = {
      'otp': otp,
      'new_password': new_password,
      'confirm_password':confirm_password,
      'email': email,
    };

    log("${body}");
    Dio dio = Dio();
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      Map map = response.data;
      if (map['status']) {
        Fluttertoast.showToast(
          msg: "Password reset successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        Get.to(() => loginscreen());
      } else {
        Fluttertoast.showToast(
          msg: "Failed to reset password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    } catch (e) {
      log('[e] error occurs $e');
    }
  }
}
