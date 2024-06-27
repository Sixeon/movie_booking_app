import 'package:flutter/material.dart';

class Mybookings extends StatefulWidget {
  const Mybookings({super.key});

  @override
  State<Mybookings> createState() => _MybookingsState();
}

class _MybookingsState extends State<Mybookings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Text(
              'Bookings',
              style: TextStyle(
                color: Color.fromARGB(100, 250, 250, 250),
                fontSize: 20,
              ),
            ),
            ListTile(
              onTap: () {
                // Get.to(PersonalInfoScreen());
              },
              title: const Text(
                'Personal Information',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing:
                  const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
            ),
            ListTile(
              onTap: () {
                // Get.to(Mybookings());
              },
              title: const Text(
                'Mybookings',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing:
                  const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
            ),
            const Text(
              'Past Bookings',
              style: TextStyle(
                color: Color.fromARGB(100, 250, 250, 250),
                fontSize: 20,
              ),
            ),
            ListTile(
              onTap: () {
                // Get.to(() => FAQScreen());
              },
              title: const Text(
                'FAQ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing:
                  const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
