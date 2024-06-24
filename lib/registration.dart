import 'dart:convert';
import 'dart:developer';
import 'package:dont_book_my_show/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class myRegister extends StatefulWidget {
  const myRegister({super.key});

  @override
  State<myRegister> createState() => _myRegisterState();
}

class _myRegisterState extends State<myRegister> {
  TextEditingController library_idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  //TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  //TextEditingController confirmPassController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool _passwordVisible = true;

  void registerUser(String name, String email, String password, String address,
      String library_id) async {
    String url = "http://10.10.10.100/web/authentication/signup";
    var body = {
      'library_id': library_id,
      'name': name,
      'email': email,
      //'mobile': mobile,
      'address': address,
      'password': password,
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
      log('${response.data}');
      log('${response.statusCode}');
      Map map = jsonDecode(response.data);
      if (map['status']) {
        Fluttertoast.showToast(
          msg: "Registration successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => loginscreen()),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Registration failed. Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
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
                padding: const EdgeInsets.only(left: 260, top: 5),
                child: const Text('Welcome Tourists',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 290, top: 27),
                child: const Text('PLEASE REGISTER',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
              Container(
                padding: EdgeInsets.only(left: 35, top: 170),
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      TextField(
                        controller: library_idController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "library_id",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'library_id',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      // SizedBox(height: 20),
                      // TextField(
                      //   controller: mobileController,
                      //   keyboardType: TextInputType.phone,
                      //   style: TextStyle(color: Colors.white),
                      //   decoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     hintText: "Mobile",
                      //     hintStyle: TextStyle(color: Colors.white),
                      //     labelText: 'Mobile',
                      //     labelStyle: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      TextField(
                        controller: addressController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "address",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'address',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passController,
                        style: TextStyle(color: Colors.white),
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(!_passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // SizedBox(height: 20),
                      // TextField(
                      //   controller: confirmPassController,
                      //   style: TextStyle(color: Colors.white),
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     hintText: "Confirm Password",
                      //     hintStyle: TextStyle(color: Colors.white),
                      //     labelText: 'Confirm Password',
                      //     labelStyle: TextStyle(color: Colors.white),
                      //
                      //   ),
                      // ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => loginscreen(),
                                ),
                              );
                            },
                            child: const Text('Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              // Validate input fields
                              if (_validateFields()) {
                                registerUser(
                                    library_idController.text.trim(),
                                    nameController.text.trim(),
                                    emailController.text.trim(),
                                    // mobileController.text.trim(),
                                    passController.text.trim(),
                                    addressController.text.trim());
                              }
                            },
                            child: const Text('Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateFields() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        // mobileController.text.isEmpty ||
        passController.text.isEmpty ||
        addressController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fill all fields.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      //   return false;
      // } else if (passController.text != addressController.text) {
      //   Fluttertoast.showToast(
      //     msg: "Passwords do not match.",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //   );
      //   return false;
    }
    return true;
  }
}
