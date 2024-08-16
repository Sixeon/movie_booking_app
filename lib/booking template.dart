import 'dart:io';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';

class TicketScreen extends StatefulWidget {
  final DateTime selectedDate;
  final String selectedTime;
  final String selectedScreen;
  final List<bool> selectedSeats;
  final Map movieData;
  TicketScreen({
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedScreen,
    required this.selectedSeats,
    required this.movieData,
  });
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final ScreenshotController screenshotController = ScreenshotController();
  String _barcodeData = Uuid().v4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Back',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: Colors.white),
            onPressed: () async {
              final imageBytes = await screenshotController.capture();
              if (imageBytes != null) {
                final directory = await getApplicationDocumentsDirectory();
                final imagePath = '${directory.path}/ticket_screen.png';
                final File localImageFile = File(imagePath);

                await localImageFile.writeAsBytes(imageBytes);

                Fluttertoast.showToast(
                  msg: "Screenshot saved to $imagePath",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  fontSize: 18,
                );
              } else {
                Fluttertoast.showToast(
                  msg: "Failed to save screenshot",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  fontSize: 18,
                );
              }
            },
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          children: [
            Image.network(
              widget.movieData['imageUrl'].toString(),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Text(
                    'Your Ticket',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 280),
                  Text(
                    'You may use the code below for\nentrance. We have also emailed you\na copy of your tickets.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                    height: 230,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.movieData['title'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${widget.selectedDate.day}/${widget.selectedDate.month}/${widget.selectedDate.year} • ${widget.selectedTime}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: _barcodeData,
                          width: 320,
                          height: 100,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
