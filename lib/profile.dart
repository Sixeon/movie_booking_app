import 'package:dont_book_my_show/homescreen.dart';
import 'package:dont_book_my_show/personalinfo.dart';
import 'package:dont_book_my_show/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white)),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.orange,
                  child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/batman.jpeg')),
                ),
              ),
              const Spacer(),
              Center(
                  child: Text(
                'Anurag',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
              Center(
                  child: Text('anuragc@gmail.com',
                      style: TextStyle(
                        color: Color.fromARGB(100, 250, 250, 250),
                      ))),
              const SizedBox(
                height: 100,
              ),
              Text('Account Settings',
                  style: TextStyle(
                      color: Color.fromARGB(100, 250, 250, 250), fontSize: 20)),
              ListTile(
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return DialogBox();
                  //   }
                  //
                  Get.to(PersonalInfoScreen());
                },
                title: const Text(
                  'Personal Information',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward,
                    size: 20, color: Colors.white),
              ),
              const Text('Help & Support',
                  style: TextStyle(
                      color: Color.fromARGB(100, 250, 250, 250), fontSize: 20)),
              ListTile(
                onTap: () {},
                title: const Text(
                  'FAQ & Help',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward,
                    size: 20, color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => myRegister());
                },
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.redAccent, fontSize: 19),
                ),
                // trailing: Text('>',style: TextStyle(color: Colors.white,fontSize: 16),),
              ),
            ],
          )),
    ));
  }
}

// Widget DialogBox(){
//   return AlertDialog(
//     title: const Text('Sign in',textAlign: TextAlign.center,),
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         const Text('Please sign in to continue'),
//         const SizedBox(height: 16),
//         TextField(
//           decoration: const InputDecoration(
//             hintText: 'Email address',
//           ),
//         ),
//         const SizedBox(height: 16),
//         TextField(
//           obscureText: true,
//           decoration: const InputDecoration(
//             hintText: 'Password',
//           ),
//         ),
//         const SizedBox(height: 24),
//         ElevatedButton(
//           onPressed: () {
//             Get.to(()=>(HomePage()));
//           },
//           child: const Text('Sign in'),
//         ),
//         const SizedBox(height: 16),
//         const Text('or'),
//         const SizedBox(height: 16),
//         ElevatedButton(
//           onPressed: () {
//             // Handle Google sign in
//           },
//           child: const Text('Google'),
//         ),
//
//       ],
//     ),
//     actions: <Widget>[
//
//     ],
//   );
Widget DialogBox() {
  return AlertDialog(
    title: const Text(
      'Personal Information',
      textAlign: TextAlign.center,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          'Name :',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            hintText: 'Email address',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            Get.to(() => (HomePage1()));
          },
          child: const Text('Sign in'),
        ),
        const SizedBox(height: 16),
        const Text('or'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Handle Google sign in
          },
          child: const Text('Google'),
        ),
      ],
    ),
    actions: <Widget>[],
  );
}
