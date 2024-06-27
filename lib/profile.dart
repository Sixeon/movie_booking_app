import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dont_book_my_show/homescreen.dart';
import 'package:dont_book_my_show/mybookings.dart';
import 'package:dont_book_my_show/personalinfo.dart';
import 'package:dont_book_my_show/registration.dart';
import 'package:dont_book_my_show/screens/FAQ_help.dart';
import 'package:dont_book_my_show/screens/booking%20template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? email;

  @override
  void initState() {
    super.initState();
    fetchemail();
  }

  Future<void> fetchemail() async {
    String url = 'http://10.10.10.136/api/login';
    Dio dio = Dio();
    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        // Assuming the response data is a JSON string
        if (response.data is String) {
          Map<String, dynamic> data = (response.data);
          setState(() {
            email = data['email'];
          });
        } else if (response.data is Map<String, dynamic>) {
          // If the response data is already a JSON object
          setState(() {
            email = response.data['email'];
          });
        }
      } else {
        log('Failed to load email, status code: ${response.statusCode}');
      }
    } catch (e) {
      log('[e] error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topCenter,
                child: InteractiveViewer(
                  boundaryMargin: EdgeInsets.all(20.0),
                  minScale: 0.5,
                  maxScale: 3.0,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.orange,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/batman.jpeg'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Anurag',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  email ?? '',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Account Settings',
                style: TextStyle(
                  color: Color.fromARGB(100, 250, 250, 250),
                  fontSize: 20,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(PersonalInfoScreen());
                },
                title: const Text(
                  'Personal Information',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  Get.to(Mybookings());
                },
                title: const Text(
                  'Mybookings',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
              ),
              const Text(
                'Help & Support',
                style: TextStyle(
                  color: Color.fromARGB(100, 250, 250, 250),
                  fontSize: 20,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => FAQScreen());
                },
                title: const Text(
                  'FAQ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => HelpScreen());
                },
                title: const Text(
                  'Help',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => ContactUsScreen());
                },
                title: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => loginscreen());
                },
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.redAccent, fontSize: 19),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'FAQ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              ExpansionTile(
                title: const Text(
                  'What is Dont Book My Show?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                children: [
                  ListTile(
                    title: const Text(
                      'Dont Book My Show is a platform where you can book your favorite shows and movies.',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text(
                  'How do I book a show?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                children: [
                  ListTile(
                    title: const Text(
                      'You can book a show by selecting the show you want to watch, choosing the date and time, and then paying for the ticket.',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
              // Add more FAQ questions and answers here
            ],
          ),
        ),
      ),
    );
  }
}

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Help',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text(
                  'How can we help you?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              ListTile(
                title: const Text(
                  'You can contact us through email or phone number.',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              // Add more help information here
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text(
                  'Email:',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                subtitle: const Text(
                  'support@dontbookmyshow.com',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              ListTile(
                title: const Text(
                  'Phone:',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                subtitle: const Text(
                  '+91 1234567789',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              // Add more contact information here
            ],
          ),
        ),
      ),
    );
  }
}

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
            Get.to(() => HomePage1());
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
