import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book_now.dart';
import 'bottomlist.dart';


class UpcomingMovieDescription extends StatefulWidget {
  final Map movieData;

  UpcomingMovieDescription({Key? key, required this.movieData}) : super(key: key);

  @override
  State<UpcomingMovieDescription> createState() => _UpcomingMoviedescription();
}

class _UpcomingMoviedescription extends State<UpcomingMovieDescription> {
  void _launchURL(String url, [ytlink]) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(
            color: Colors.amber, weight: 50, opticalSize: 50),
        actions: [
          IconButton(
            icon: _isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border_outlined),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
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
            Image.network(
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.movieData['specs'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.movieData['releaseDate'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),
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
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 5),
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
                heightFactor: 50,
                child: InkWell(
                  onTap: () {
                    _launchURL(widget.movieData['ytlink'].toString());
                  },
                  child: const Icon(
                    Icons.play_circle_outline,
                    size: 70,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
