import 'package:dont_book_my_show/book_now.dart';
import 'package:dont_book_my_show/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'favorite_movies.dart';


class MovieInfoDescription extends StatefulWidget {
  Map movieData;

  MovieInfoDescription({super.key, required this.movieData});

  @override
  State<MovieInfoDescription> createState() => _MovieInfoDescriptionState();
}

class _MovieInfoDescriptionState extends State<MovieInfoDescription> {
  void _launchURL(String url, [ytlink]) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  bool _isFavorite = false;
 // FavoriteMovies _favoriteMovies = FavoriteMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: _isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border_outlined),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
                if (_isFavorite) {
                  // Add movie to favorite list
                  //FavoriteMovies.favoriteMovies.add(widget.movieData);
                } else {
                  // Remove movie from favorite list
                  //FavoriteMovies.favoriteMovies.remove(widget.movieData);
                }
              });

            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Image.asset(
              widget.movieData['imageUrl'].toString(),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(1.0),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                          child: Text(
                            widget.movieData['rating'].toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              //fontFamily: 'cursive',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.movieData['specs'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          widget.movieData['title'].toString(),
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                           // showDialog(
                             //   context: context,
                               // builder: (BuildContext context) {
                                 // return DialogBox();
                               // });
                            showModalBottomSheet<void>(
                              context: context,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                              // ),
                              builder: ( context) =>
                                timeSelection(),
                            );
                            // Navigator.push(
                            //   context,
                            // MaterialPageRoute(
                            //builder: (context) => SeatSelect(title: widget.movieData['title'].toString())),
                            //);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          child: Text(
                            'BOOK NOW',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 13),
                    Text(
                      widget.movieData['description'].toString(),
                      style: const TextStyle(
                        fontFamily: 'valera',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: InkWell(
                onTap: (){
                  _launchURL(widget.movieData['ytlink'].toString());

                },
                child: Icon(
                  Icons.play_circle_outline,
                  size: 70,
                  color: Colors.white,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget DialogBox() {
    return AlertDialog(
      title: const Text(
        'Sign in',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Please sign in to continue'),
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
              Get.to(() => (HomePage1()));
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

  Widget makeDissmissable({required Widget child})=>GestureDetector(
    behavior:  HitTestBehavior.opaque,
    onTap: ()=>Navigator.of(context).pop(),
    child: GestureDetector(
      onTap: (){},
      child: child,
    ),
  );
  Widget timeSelection() {
    DateTime? _selectedDate;
    TimeOfDay? _selectedTime;
    return  makeDissmissable(child: DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 1,
      maxChildSize: 1,
      builder: (_,controller)
      {
        return Container(
        padding: EdgeInsets.all(10),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
          color: Colors.black,

        ) ,
          // height: 1200,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Movie poster and details
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(widget.movieData['imageUrl'].toString(), width: 150),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.movieData['title'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.movieData['rating'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.movieData['specs'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              _launchURL(widget.movieData['ytlink'].toString());
                            },
                            child: Text('Watch Trailer'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        
                // Date selection
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    'Choose a date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
                        },
                        child: Container(
                          width: 100,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedDate == date
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
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Time selection
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Choose a time',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedTime == time
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              time.format(context),
                              style: TextStyle(
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
                    Get.to(ChooseSeatsPage());
                  },
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
