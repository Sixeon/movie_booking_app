import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'auth_token.dart';
import 'login.dart';

class AdminDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to manage movies page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageMoviesPage(),
                  ),
                );
              },
              child: Text('Manage Movies'),
            ),
            SizedBox(height: 24),
            // Add more functionalities like managing bookings, analytics, etc.
          ],
        ),
      ),
    );
  }
}

class ManageMoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Movies'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual movie list count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Movie ${index + 1}',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Director, Genre',
              style: TextStyle(color: Colors.white),
            ), // Add more details
            trailing: IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigate to movie editing page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditMoviePage(
                      movieIndex: index,
                      movieData: {},
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add movie page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMoviePage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class EditMoviePage extends StatefulWidget {
  final Map<String, dynamic> movieData;
  final int movieIndex;

  EditMoviePage({required this.movieData, required this.movieIndex});

  @override
  _EditMoviePageState createState() => _EditMoviePageState();
}

class _EditMoviePageState extends State<EditMoviePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _genreController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _releaseDateController = TextEditingController();
  TextEditingController _directorController = TextEditingController();
  TextEditingController _showtimesController = TextEditingController();
  TextEditingController _showStartDateController = TextEditingController();
  TextEditingController _showEndDateController = TextEditingController();
  TextEditingController _seatPriceStandardController = TextEditingController();
  TextEditingController _seatPriceReclinerController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.movieData['title'];
    _genreController.text = widget.movieData['genre'].join(', ');
    _durationController.text = widget.movieData['duration'];
    _releaseDateController.text = widget.movieData['release_date'];
    _directorController.text = widget.movieData['director'];
    _showtimesController.text = widget.movieData['showtimes'].join(', ');
    _showStartDateController.text = widget.movieData['show_start_date'];
    _showEndDateController.text = widget.movieData['show_end_date'];
    _seatPriceStandardController.text =
        widget.movieData['seat_price_standard'].toString();
    _seatPriceReclinerController.text =
        widget.movieData['seat_price_recliner'].toString();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _genreController.dispose();
    _durationController.dispose();
    _releaseDateController.dispose();
    _directorController.dispose();
    _showtimesController.dispose();
    _showStartDateController.dispose();
    _showEndDateController.dispose();
    _seatPriceStandardController.dispose();
    _seatPriceReclinerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Movie'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _genreController,
                decoration: InputDecoration(labelText: 'Genre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter at least one genre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(labelText: 'Duration'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the duration';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _releaseDateController,
                decoration: InputDecoration(labelText: 'Release Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the release date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _directorController,
                decoration: InputDecoration(labelText: 'Director'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the director';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _showtimesController,
                decoration: InputDecoration(labelText: 'Showtimes'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter at least one showtime';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _showStartDateController,
                decoration: InputDecoration(labelText: 'Show Start Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the show start date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _showEndDateController,
                decoration: InputDecoration(labelText: 'Show End Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the show end date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _seatPriceStandardController,
                decoration: InputDecoration(labelText: 'Seat Price (Standard)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the seat price';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _seatPriceReclinerController,
                decoration: InputDecoration(labelText: 'Seat Price (Recliner)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the seat price';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Perform form validation before submission
                  if (_formKey.currentState!.validate()) {
                    _submitForm();
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {

    String title = _titleController.text.trim();
    String genre = _genreController.text.trim();
    String duration = _durationController.text.trim();
    String releaseDate = _releaseDateController.text.trim();
    String director = _directorController.text.trim();
    String showtimes = _showtimesController.text.trim();
    String showStartDate = _showStartDateController.text.trim();
    String showEndDate = _showEndDateController.text.trim();
    String seatPriceStandard = _seatPriceStandardController.text.trim();
    String seatPriceRecliner = _seatPriceReclinerController.text.trim();

    Map<String, dynamic> updatedMovieData = {
      "title": title,
      "genre": [genre],
      "duration": duration,
      "release_date": releaseDate,
      "director": director,
      "showtimes": showtimes.split(",").map((e) => e.trim()).toList(),
      "show_start_date": showStartDate,
      "show_end_date": showEndDate,
      "seat_price_standard": int.parse(seatPriceStandard),
      "seat_price_recliner": int.parse(seatPriceRecliner),
    };
    final dio = Dio();
    final apiUrl = 'http://10.10.10.139/api/edit_movie/${widget.movieIndex}';

    try {
      final response = await dio.patch(
        apiUrl,
        data: updatedMovieData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Successful response
        print('Movie updated successfully');
        // Optionally, navigate to a success page or show a dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Movie Updated'),
            content: Text('Movie details have been updated successfully.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Optionally navigate to another page
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Error occurred
        print('Failed to update movie: ${response.statusCode}');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to update movie: ${response.statusCode}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Exception occurred
      print('Exception: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Exception occurred: $e'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

class AddMoviePage extends StatefulWidget {
  @override
  _AddMoviePageState createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  TextEditingController _imageUrl = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _genreController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _releaseDateController = TextEditingController();
  TextEditingController _directorController = TextEditingController();
  TextEditingController _showtimesController = TextEditingController();
  TextEditingController _showStartDateController = TextEditingController();
  TextEditingController _showEndDateController = TextEditingController();
  TextEditingController _seatPriceRegularController = TextEditingController();
  TextEditingController _seatPriceReclinerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _imageUrl.dispose();
    _titleController.dispose();
    _genreController.dispose();
    _durationController.dispose();
    _releaseDateController.dispose();
    _directorController.dispose();
    _showtimesController.dispose();
    _showStartDateController.dispose();
    _showEndDateController.dispose();
    _seatPriceRegularController.dispose();
    _seatPriceReclinerController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Add Movie',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/batman.jpeg'))),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text("Enter the details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2)),
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _imageUrl,
                  decoration: InputDecoration(
                      labelText: 'ImageUrl',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.movie)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a imageurl';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.movie)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _genreController,
                  decoration: InputDecoration(
                      labelText: 'Genre',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.category)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter at least one genre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _durationController,
                  decoration: InputDecoration(
                      labelText: 'Duration',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.timer)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the duration';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _releaseDateController,
                  decoration: InputDecoration(
                      labelText: 'Release Date',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.date_range)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the release date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _directorController,
                  decoration: InputDecoration(
                      labelText: 'Director',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the director';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _showtimesController,
                  decoration: InputDecoration(
                      labelText: 'Showtimes',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.more_time)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter at least one showtime';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _showStartDateController,
                  decoration: InputDecoration(
                      labelText: 'Show Start Date',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.date_range_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context, _showStartDateController);
                        },
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the show start date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _showEndDateController,
                  decoration: InputDecoration(
                      labelText: 'Show End Date',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.date_range_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context, _showEndDateController);
                        },
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the show end date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _seatPriceRegularController,
                  decoration: InputDecoration(
                      labelText: 'Seat Price Regular',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.price_change_rounded)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the seat price';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _seatPriceReclinerController,
                  decoration: InputDecoration(
                      labelText: 'Seat Price Recliner',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.price_change)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the seat price';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitForm();
                    }
                  },
                  child: Text('Add Movie'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    String image_url=_imageUrl.text.trim();
    String title = _titleController.text.trim();
    String genre = _genreController.text.trim();
    String duration = _durationController.text.trim();
    String releaseDate = _releaseDateController.text.trim();
    String director = _directorController.text.trim();
    String showtimes = _showtimesController.text.trim();
    String show_start_date = _showStartDateController.text.trim();
    String show_end_date = _showEndDateController.text.trim();
    String seat_price_standard = _seatPriceRegularController.text.trim();
    String seat_price_recliner = _seatPriceReclinerController.text.trim();

    Map<String, dynamic> movieData = {
       "image_url":image_url,
      "title": title,
      "genre": [genre],
      "duration": duration,
      "release_date": releaseDate,
      "director": director,
      "showtimes": showtimes.split(",").map((e) => e.trim()).toList(),
      "show_start_date": show_start_date,
      "show_end_date": show_end_date,
      "seat_price_standard":
          int.parse(seat_price_standard),
      "seat_price_recliner": int.parse(seat_price_recliner),
    };

    log("${movieData}");
    final dio = Dio();
    String url = 'http://10.10.10.139/api/add_movie';

    try {
      final response = await dio.post(
        url,
        data: movieData,
        options: Options(
          headers: {
            "Authorization":"Bearer ${AccessTokens.authToken}",
            'Content-Type': 'application/json',
          },
        ),
      );
      log("${movieData}");
      log("${response.statusCode}");
      Map map = response.data;
      if (map['status']) {
        print('Movie added successfully');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Movie Added'),
            content: Text('Movie has been added successfully.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        print('Failed to add movie: ${response.statusCode}');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add movie: ${map['message']}}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Exception: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Exception occurred: $e'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
