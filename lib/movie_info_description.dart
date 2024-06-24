import 'package:dont_book_my_show/book_now.dart';
import 'package:dont_book_my_show/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieInfoDescription extends StatefulWidget {
  Map movieData;

  MovieInfoDescription({super.key, required this.movieData});

  @override
  State<MovieInfoDescription> createState() => _MovieInfoDescriptionState();
}

class _MovieInfoDescriptionState extends State<MovieInfoDescription> {
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
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Image.asset(
              widget.movieData['Poster'].toString(),
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
                      widget.movieData['Runtime'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          widget.movieData['Title'].toString(),
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
Get.to(ChooseSeatsPage());
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
            // Positioned(
            //   bottom: -10,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     height: 60,
            //     padding: const EdgeInsets.all(20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         IconButton(
            //           icon: const Icon(
            //             Icons.home,
            //             color: Colors.white,
            //           ),
            //           onPressed: () {
            //             Get.to(() => HomePage());
            //           },
            //         ),
            //         IconButton(
            //           icon: const Icon(
            //             Icons.favorite,
            //             color: Colors.white,
            //           ),
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const HomePage()),
            //             );
            //           },
            //         ),
            //         IconButton(
            //           icon: const Icon(
            //             Icons.bookmark,
            //             color: Colors.white,
            //           ),
            //           onPressed: () {},
            //         ),
            //         IconButton(
            //           icon: const Icon(
            //             Icons.person,
            //             color: Colors.white,
            //           ),
            //           onPressed: () {},
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const Center(
              child: Icon(
                Icons.play_circle_outline,
                size: 70,
                color: Colors.white,
              ),
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
}
