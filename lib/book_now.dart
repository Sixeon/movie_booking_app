import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ticket Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChooseSeatsPage(),
    );
  }
}

class ChooseSeatsPage extends StatefulWidget {
  @override
  _ChooseSeatsPageState createState() => _ChooseSeatsPageState();
}

class _ChooseSeatsPageState extends State<ChooseSeatsPage> {
  // Seat selection logic
  List<bool> selectedSeats = List<bool>.filled(60, false);
  int totalSelectedSeats = 0;

  // Date and time selection logic
  DateTime selectedDate = DateTime.now();
  String selectedTime = '7:00 PM'; // Add time selection
  String selectedScreen = 'Screen 1'; // Add screen selection

  // Booking logic
  double totalPrice = 0.0;

  final List<String> timeList = ['7:00 PM', '8:00 PM', '9:00 PM', '10:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Choose Your Seats', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Location
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.location_pin),
                  SizedBox(width: 8),
                  Text(
                    'Rupasi cinema hall Agartala',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            // Seat Layout
            Container(
              // height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Screen
                  Text(
                    'Screen',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Screen 1', style: TextStyle(color: Colors.white)),
                      Radio(
                        value: 'Screen 1',
                        groupValue: selectedScreen,
                        onChanged: (value) {
                          setState(() {
                            selectedScreen = value as String;
                          });
                        },
                      ),
                      Text('Screen 2,', style: TextStyle(color: Colors.white)),
                      Radio(
                        value: 'Screen 2',
                        groupValue: selectedScreen,
                        onChanged: (value) {
                          setState(() {
                            selectedScreen = value as String;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Seats
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Left side seats
                      Row(
                        children: List.generate(10, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSeats[index] = !selectedSeats[index];
                                totalSelectedSeats = selectedSeats
                                    .where((element) => element)
                                    .length;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: selectedSeats[index]
                                    ? Colors.red
                                    : Colors.grey[300],
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'A${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      // Right side seats
                      Row(
                        children: List.generate(10, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSeats[index + 10] =
                                !selectedSeats[index + 10];
                                totalSelectedSeats = selectedSeats
                                    .where((element) => element)
                                    .length;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: selectedSeats[index + 10]
                                    ? Colors.red
                                    : Colors.grey[300],
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'B${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      // Middle seats
                      Row(
                        children: List.generate(10, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSeats[index + 20] =
                                !selectedSeats[index + 20];
                                totalSelectedSeats = selectedSeats
                                    .where((element) => element)
                                    .length;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: selectedSeats[index + 20]
                                    ? Colors.red
                                    : Colors.grey[300],
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'C${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      Row(
                          children: [
                            Column(
                              children: List.generate(4, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSeats[index + 30] =
                                      !selectedSeats[index + 30];
                                      totalSelectedSeats = selectedSeats
                                          .where((element) => element)
                                          .length;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: selectedSeats[index + 30]
                                          ? Colors.red
                                          : Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'D${index + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Column(
                              children: List.generate(4, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSeats[index + 34] =
                                      !selectedSeats[index + 34];
                                      totalSelectedSeats = selectedSeats
                                          .where((element) => element)
                                          .length;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: selectedSeats[index + 34]
                                          ? Colors.red
                                          : Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'E${index + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(width: 60,),
                            Column(
                              children: List.generate(4, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSeats[index + 38] =
                                      !selectedSeats[index + 38];
                                      totalSelectedSeats = selectedSeats
                                          .where((element) => element)
                                          .length;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: selectedSeats[index + 38]
                                          ? Colors.red
                                          : Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'F${index + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Column(
                              children: List.generate(4, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSeats[index + 42] =
                                      !selectedSeats[index + 42];
                                      totalSelectedSeats = selectedSeats
                                          .where((element) => element)
                                          .length;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: selectedSeats[index + 42]
                                          ? Colors.red
                                          : Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'G${index + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Column(
                              children: List.generate(4, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSeats[index + 46] =
                                      !selectedSeats[index + 46];
                                      totalSelectedSeats = selectedSeats
                                          .where((element) => element)
                                          .length;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: selectedSeats[index + 46]
                                          ? Colors.red
                                          : Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'H${index + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(width: 60,),
                            Column(
                              children: List.generate(4, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSeats[index + 50] =
                                      !selectedSeats[index + 50];
                                      totalSelectedSeats = selectedSeats
                                          .where((element) => element)
                                          .length;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: selectedSeats[index + 50]
                                          ? Colors.red
                                          : Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'I${index + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Column(
                              children: List.generate(4, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSeats[index + 54] =
                                      !selectedSeats[index + 54];
                                      totalSelectedSeats = selectedSeats
                                          .where((element) => element)
                                          .length;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: selectedSeats[index + 54]
                                          ? Colors.red
                                          : Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'J${index + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              );
                            }),
                          ),

                        ]
                      ),

                      // SizedBox(height: 30,),
                      // Row(
                      //   children: List.generate(10, (index) {
                      //     return GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //           selectedSeats[index+58] = !selectedSeats[index+58];
                      //           totalSelectedSeats = selectedSeats
                      //               .where((element) => element)
                      //               .length;
                      //         });
                      //       },
                      //       child: Container(
                      //         width: 40,
                      //         height: 40,
                      //         decoration: BoxDecoration(
                      //           color: selectedSeats[index+58]
                      //               ? Colors.red
                      //               : Colors.grey[300],
                      //           border: Border.all(
                      //             color: Colors.black,
                      //             width: 1,
                      //           ),
                      //           borderRadius: BorderRadius.circular(5),
                      //         ),
                      //         child: Center(
                      //           child: Text(
                      //             'K${index + 1}',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }),
                      // ),
                      // Row(
                      //   children: List.generate(10, (index) {
                      //     return GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //           selectedSeats[index+68] = !selectedSeats[index+68];
                      //           totalSelectedSeats = selectedSeats
                      //               .where((element) => element)
                      //               .length;
                      //         });
                      //       },
                      //       child: Container(
                      //         width: 40,
                      //         height: 40,
                      //         decoration: BoxDecoration(
                      //           color: selectedSeats[index+68]
                      //               ? Colors.red
                      //               : Colors.grey[300],
                      //           border: Border.all(
                      //             color: Colors.black,
                      //             width: 1,
                      //           ),
                      //           borderRadius: BorderRadius.circular(5),
                      //         ),
                      //         child: Center(
                      //           child: Text(
                      //             'L${index + 1}',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }),
                      // ),
                      // Row(
                      //   children: List.generate(10, (index) {
                      //     return GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //           selectedSeats[index+78] = !selectedSeats[index+78];
                      //           totalSelectedSeats = selectedSeats
                      //               .where((element) => element)
                      //               .length;
                      //         });
                      //       },
                      //       child: Container(
                      //         width: 40,
                      //         height: 40,
                      //         decoration: BoxDecoration(
                      //           color: selectedSeats[index+78]
                      //               ? Colors.red
                      //               : Colors.grey[300],
                      //           border: Border.all(
                      //             color: Colors.black,
                      //             width: 1,
                      //           ),
                      //           borderRadius: BorderRadius.circular(5),
                      //         ),
                      //         child: Center(
                      //           child: Text(
                      //             'M${index + 1}',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            // Seat Legend

            Padding(

              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Available', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Selected', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Reserved', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            // Date and Time Picker
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Select Date & Time',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Date Picker
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Time Selector
                      Expanded(
                        child: DropdownButton(
                          dropdownColor: Colors.grey,
                          value: selectedTime,
                          items: timeList.map((time) {
                            return DropdownMenuItem(
                              value: time,

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(time,
                                      style: TextStyle(color: Colors.white)),
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedTime = value as String;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \₹${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            // Book Now Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: totalSelectedSeats > 0
                    ? () {
                        setState(() {
                          totalPrice = totalSelectedSeats * 100.0;
                          // Add your booking logic here
                          print('Booking confirmed!');
                          print(
                              'Selected seats: ${selectedSeats.asMap().entries.where((element) => element.value).map((e) => e.key + 1).toList()}');
                          print(
                              'Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}');
                          print('Time: $selectedTime');
                          print('Screen: $selectedScreen');
                        });
                        Fluttertoast.showToast(
                          msg: "Booking confirmed",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          fontSize: 15,
                          textColor: Colors.white,

                        ); }
                    : null,
                child: Text('Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
