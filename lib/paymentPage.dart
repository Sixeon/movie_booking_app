import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'booking template.dart';

class PaymentPage extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedTime;
  final String selectedScreen;
  final List<bool> selectedSeats;
  final Map movieData;

  PaymentPage({
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedScreen,
    required this.selectedSeats,
    required this.movieData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        forceMaterialTransparency: true,
        title: Text('Payment Page',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Image.network(
              movieData['imageUrl'].toString(), // Accessing imageUrl from movieData
              width: 250,
            ),

            SizedBox(height: 20),

            // Container to wrap selected details
            Container(
              width: 350,
              height: 220,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieData['title'].toString(), // Accessing title from movieData
                    style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Show Date:$selectedDate',
                    style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Show Time:$selectedTime',
                    style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Screen:$selectedScreen',
                    style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Seats:${selectedSeats.where((seat) => seat).length}',
                    style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketScreen(
                      selectedDate: selectedDate,
                      selectedTime: selectedTime,
                      selectedScreen: selectedScreen,
                      selectedSeats: selectedSeats,
                      movieData: movieData, // Passing movieData to TicketScreen
                    ),
                  ),
                );
                print('Booking confirmed!');
                print(
                  'Selected seats: ${selectedSeats.asMap().entries.where((element) => element.value).map((e) => e.key + 1).toList()}',
                );
                print(
                  'Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                );
                print('Time: $selectedTime');
                print('Screen: $selectedScreen');
                Fluttertoast.showToast(
                  msg: "Booking Confirmed",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.white,
                  fontSize: 20,
                  textColor: Colors.black,
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
