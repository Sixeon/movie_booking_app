import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book_now.dart';

DateTime? _selectedDate;
TimeOfDay? _selectedTime;

class TimeSelectionSheet extends StatefulWidget {
  final Map movieData;

  TimeSelectionSheet({Key? key, required this.movieData}) : super(key: key);

  @override
  _TimeSelectionSheetState createState() => _TimeSelectionSheetState();
}

class _TimeSelectionSheetState extends State<TimeSelectionSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 1,
      maxChildSize: 1,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.black87,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Movie poster and details
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.network(widget.movieData['imageUrl'].toString(),
                          width: 150),
                      const SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.movieData['title'].toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.movieData['rating'].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.movieData['specs'].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              _launchURL(widget.movieData['ytlink'].toString());
                            },
                            child: const Text('Watch Trailer'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Date selection
                const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    'Choose a date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      DateTime date = DateTime.now().add(Duration(days: index));
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = date;
                          });
                          log("[i] selected date $_selectedDate");
                        },
                        child: Container(
                          width: 100,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedDate != null &&
                                      _selectedDate!.day == date.day
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '${date.day}/${date.month}/${date.year}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: _selectedDate != null &&
                                        _selectedDate!.day == date.day
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Time selection
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Choose a time',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      TimeOfDay time = TimeOfDay(hour: 9 + index, minute: 0);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTime = time;
                          });
                          log("[i] selected time $_selectedTime");
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedTime != null &&
                                      _selectedTime!.hour == time.hour
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              time.format(context),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  child: const Text('Reservation'),
                  onPressed: () {
                    if (_selectedDate != null && _selectedTime != null) {
                      Get.to(
                        ChooseSeatsPage(
                          selectedDate: _selectedDate!,
                          selectedTime: _selectedTime!.format(context),
                          selectedScreen: '',
                          movieData: widget.movieData,

                          // Pass other required data to ChooseSeatsPage
                        ),
                      );
                    } else {
                      // Show an error message or alert if date or time is not selected
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
