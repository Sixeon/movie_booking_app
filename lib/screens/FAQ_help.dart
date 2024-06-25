import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
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
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Help & Support',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  // Add your FAQ page route here
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
                  // Add your Help page route here
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
                  // Add your Contact Us page route here
                  Get.to(() => ContactUsScreen());
                },
                title: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
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
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'FAQ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Help',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  'Email:',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                subtitle: const Text(
                  'upport@dontbookmyshow.com',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              ListTile(
                title: const Text(
                  'Phone:',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                subtitle: const Text(
                  '+91 1234567890',
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