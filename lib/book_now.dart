import 'package:dont_book_my_show/paymentPage.dart';
import 'package:flutter/material.dart';

class ChooseSeatsPage extends StatefulWidget {
  final DateTime selectedDate;
  final String selectedTime;
  final String selectedScreen;
  final Map movieData;

  ChooseSeatsPage({
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedScreen, required this.movieData,
  });

  @override
  _ChooseSeatsPageState createState() => _ChooseSeatsPageState();
}

class _ChooseSeatsPageState extends State<ChooseSeatsPage> {
  List<bool> selectedSeats = List<bool>.filled(60, false);
  int totalSelectedSeats = 0;
  String _selectedScreen = '';

  @override
  void initState() {
    super.initState();
    _selectedScreen = widget.selectedScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Choose Your Seats', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Location
          const Padding(
            padding: EdgeInsets.all(16.0),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Screen
                const Text(
                  'Screen',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Screen 1', style: TextStyle(color: Colors.white)),
                    Radio(
                      value: 'Screen 1',
                      groupValue: _selectedScreen,
                      onChanged: (value) {
                        setState(() {
                          _selectedScreen = value as String;
                        });
                      },
                    ),
                    const Text('Screen 2', style: TextStyle(color: Colors.white)),
                    Radio(
                      value: 'Screen 2',
                      groupValue: _selectedScreen,
                      onChanged: (value) {
                        setState(() {
                          _selectedScreen = value as String;
                        });
                      },
                    ),
                    const Text('Screen 3', style: TextStyle(color: Colors.white)),
                    Radio(
                      value: 'Screen 3',
                      groupValue: _selectedScreen,
                      onChanged: (value) {
                        setState(() {
                          _selectedScreen = value as String;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
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
                              selectedSeats[index] =!selectedSeats[index];
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
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Confirm button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    selectedDate: widget.selectedDate,
                    selectedTime: widget.selectedTime,
                    selectedScreen: _selectedScreen,
                    selectedSeats: selectedSeats,
                      movieData: widget.movieData,
                  ),
                ),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}