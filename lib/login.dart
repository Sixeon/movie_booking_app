import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dont_book_my_show/homescreen.dart';
import 'package:dont_book_my_show/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

//void main(){
// runApp(LoginScreen());
//}
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
          Container(


          ),
          // Container(
          //   decoration: BoxDecoration(
          //
          //       gradient: LinearGradient(colors: [
          //     Colors.black,
          //     Colors.black.withOpacity(0.8),
          //     Colors.black.withOpacity(0.15),
          //     Colors.black.withOpacity(0.5),
          //   ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          // ),
          // Expanded(child: ListView.builder(
          //   itemCount: numbers.length, // Replace 10 with the length of your data list
          //   itemBuilder: (context, index) {
          //     // Replace this with the widget you want to use for each item
          //     return ListTile(
          //       title: Text('Item number $index'),
          //     );
          //   },
          // ),),
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
                    decoration:  InputDecoration(
                      hintText: 'email',
                      label: Text('email'),
                      prefixIcon:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.email_rounded)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)
                        ),
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
                              bottomRight: Radius.circular(12)
                          ),
                        ),

                      hintText: 'password',
                      label: const Text('Password'),
                      fillColor: const Color(0xffD8D8DD),
                      filled: true,
                      prefixIcon: IconButton(
                        onPressed: (){}, icon: Icon(Icons.key),
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
                const Padding(
                  padding: EdgeInsets.only(left: 19, top: 8, right: 19),
                  child: Row(
                    children: [
                      //AnimatedSwitch(//
                      //  colorOff: Color(0xffA09F99),
                      //),

                      Spacer(),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17
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
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {

                    Get.to(HomePage1());
                      // login(
                      //  emailController.text.trim(),
                      //     passwordController.text.trim());
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
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    ],
                  ),
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
                          style: TextStyle(
                            color: Colors.white,fontSize: 17
                          ),
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
    )));
  }

  void login(String email,String password ) async {
    String url = "http://10.10.10.136/api/login";
    var body = {
      'email':email,
      'password':password,
    };
    log("${body}");
    Dio dio = Dio();
    try {
      var response = await dio.post(
        url,
        data:body,
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
          msg: "Sign in successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.white,
            textColor: Colors.black
        );
      //log("[i] ${jsonDecode(response.data)}");
     // Map map = jsonDecode(response.data);

        Get.to(() => HomePage1());
        // Handle the successful response here
        // e.g., navigate to another screen or show a success message.
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
}
