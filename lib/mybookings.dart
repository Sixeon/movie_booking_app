import 'package:dont_book_my_show/booking%20template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20,),
            Text(
              'Bookings',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),

            ListTile(
              onTap: () {

              },
              title: const Text(
                'Active Bookings',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing:
                  const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
            ),
            ListTile(
              onTap: () {
                 //Get.to((TicketScreen()));
              },
              title: const Text(
                'Past Bookings',
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
