import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:dont_book_my_show/All_Movies.dart';
import 'package:dont_book_my_show/movie_info_description.dart';
import 'package:dont_book_my_show/profile.dart';
// import 'package:dont_book_my_show/screens/booking%20template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'UpcomingMovieDescription.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({super.key});
  bool isDark = false;

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  BuildContext? _context;

  List? listofspots = [];
  String? name;
  final List carouselMovieData = [
    {
      "title": "Kalki 2898 AD",
      "rating": "IMDb:9.3",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719812064/Kalki-2898-AD_box_office_collection_day_1_prabhas_1719548189918_1719574247509_gjswde.jpg',
      "specs": 'Action : 2hr 30 min',
      "description":
          'A modern-day avatar of Vishnu, a Hindu god, who is believed '
              'to have descended to earth to protect the world from evil forces.',
      'ytlink': 'https://youtu.be/kQDd1AhGIHk?si=x5Uk4xL2tzUo9RVE',
    },
    {
      "title": "Avengers infinity war",
      "rating": "IMDb:8.2",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813982/avengers_infinity_war_ver10_xlg_hnrdtu.jpg',
      "specs": 'Action : 2hr 30 min',
      "description":
          'In the 1970s, a gangster named Rocky goes undercover as a slave to '
              'assassinate the owner of a notorious gold mine known as the Kolar Gold Fields',
      'ytlink': 'https://youtu.be/-KfsY-qwBS0?si=J2otMdb66PBz1gyQ',
    },
    {
      "title": "Uri",
      "rating": "IMDb:5.8",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719812957/uri-indi_icav2r.jpg',
      "specs": 'Action,Thriller : 2 hr 01 min',
      "description":
          'An Indian agent races against a doomsday clock as a ruthless mercenary,'
              ' with a bitter vendetta, mounts an apocalyptic attack against the country',
      'ytlink': 'https://youtu.be/vqu4z34wENw?si=96oukwpJS1gyAro1',
    },
    {
      "title": "Fury",
      "rating": "IMDb:7.6",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719811749/fury_ver2_xlg_gxxmej.jpg',
      "specs": 'Action,War : 2hr 14min',
      "description":
          'A grizzled tank commander makes tough decisions as he and '
              'his crew fight their way across Germany in April, 1945.',
      'ytlink': 'https://youtu.be/q94n3eWOWXM?si=tIcuXBZptmiwdICI',
    },
    {
      "title": "Joker",
      "rating": "IMDb:7.4",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719812545/97da6d6bc6641ade91c5510f6539d10c46f3dbc367ba03718eb4db08ff968e3f_wufemj.jpg',
      "specs": 'Action,Thriller : 2hr 11 min',
      "description":
          'John Wick is on the run after killing a member of the international assassins guild, '
              'and with a '
              '14 million price tag on his head, he is the target of hit men and women everywhere',
      'ytlink': 'https://youtu.be/M7XM597XO94?si=Wxpm-2zbRUDTgsJJ',
    },
    {
      "title": 'Salaar',
      "rating": 'IMDb:6.4',
      "specs": 'Action, Thriller:',
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719812683/101561141_j0vb0v.jpg',
      "description": 'The story of khalsar, and two friends who turned foe.',
      "ytlink": 'new day new dawn',
    },
    {
      "title": 'Karwaan',
      "rating": 'IMDb:7.6',
      "specs": 'Adventure,Comedy,Drama \n: 1hr 54min',
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719897397/3169a5186af3b6d958efa9d66b5d5f5e56c8a1c238cee16f8d1ae6d3e9481490_j50taz.jpg',
      "description":
          'Avinash and his friend Shaukat decide to take a trip to Kochi to sort out a misunderstanding. However, due '
              'to a twist of fate, a teenager ends up joining them on the trip.',
      "ytlink": 'https://youtu.be/IUCeN7kelXs?si=qF8oQglVSnGWd6UQ',
    }
  ];
  List listOfPopularMovies = [
    {
      "title": "Kalki 2898 AD",
      "rating": "IMDb:9.3",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813157/kalki_2898_ad_jaluls.jpg',
      "specs": 'Action : 2hr 30 min',
      "description":
          'A modern-day avatar of Vishnu, a Hindu god, who is believed '
              'to have descended to earth to protect the world from evil forces.',
      'ytlink': 'https://youtu.be/kQDd1AhGIHk?si=x5Uk4xL2tzUo9RVE',
    },
    {
      "title": "K.G.F:Chapter 2",
      "rating": "IMDb:8.2",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813367/f5a21f64af7359f7aaa7c29dee8a12a97630e707cdbf71e0ae6b063322fb8575_xmvuyb.jpg',
      "specs": 'Action : 2hr 30 min',
      "description":
          'In the 1970s, a gangster named Rocky goes undercover as a slave to '
              'assassinate the owner of a notorious gold mine known as the Kolar Gold Fields',
      'ytlink': 'https://youtu.be/-KfsY-qwBS0?si=J2otMdb66PBz1gyQ',
    },
    {
      "title": "Pathaan",
      "rating": "IMDb:5.8",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813408/pathaan_adfcih.jpg',
      "specs": 'Action,Thriller : 2 hr 01 min',
      "description":
          'An Indian agent races against a doomsday clock as a ruthless mercenary,'
              ' with a bitter vendetta, mounts an apocalyptic attack against the country',
      'ytlink': 'https://youtu.be/vqu4z34wENw?si=96oukwpJS1gyAro1',
    },
    {
      "title": "Fury",
      "rating": "IMDb:7.6",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719812349/fury_ver6_pt3yaj.jpg',
      "specs": 'Action,War : 2hr 14min',
      "description":
          'A grizzled tank commander makes tough decisions as he and '
              'his crew fight their way across Germany in April, 1945.',
      'ytlink': 'https://youtu.be/q94n3eWOWXM?si=tIcuXBZptmiwdICI',
    },
    {
      "title": "John Wick 3",
      "rating": "IMDb:7.4",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813504/MV5BMDg2YzI0ODctYjliMy00NTU0LTkxODYtYTNkNjQwMzVmOTcxXkEyXkFqcGdeQXVyNjg2NjQwMDQ_._V1_FMjpg_UX1000__tfaqg9.jpg',
      "specs": 'Action,Thriller : 2hr 11 min',
      "description":
          'John Wick is on the run after killing a member of the international assassins guild, '
              'and with a '
              '14 million price tag on his head, he is the target of hit men and women everywhere',
      'ytlink': 'https://youtu.be/M7XM597XO94?si=Wxpm-2zbRUDTgsJJ',
    },
  ];

  List listOfMovies = [
    {
      "title": 'Karwaan',
      "rating": 'IMDb:7.6',
      "specs": 'Adventure,Comedy,Drama \n: 1hr 54min',
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719897397/3169a5186af3b6d958efa9d66b5d5f5e56c8a1c238cee16f8d1ae6d3e9481490_j50taz.jpg',
      "description":
          'Avinash and his friend Shaukat decide to take a trip to Kochi to sort out a misunderstanding. However, due '
              'to a twist of fate, a teenager ends up joining them on the trip.',
      "ytlink": 'https://youtu.be/IUCeN7kelXs?si=qF8oQglVSnGWd6UQ',
    },
    {
      "title": 'Salaar',
      "rating": 'IMDb:6.5',
      "specs": 'Action,Crime,Drama \n:2hr 55min',
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719897468/MV5BYWYwMWU2N2QtMjExOC00OWY1LTllYzEtYWZjYzZlY2IwMzVhXkEyXkFqcGdeQXVyNjE0ODgwMDA_._V1__vq24wf.jpg',
      "description":
          'The fate of a violently contested kingdom hangs on the fraught bond between two friends-turned-foes '
              'in this saga of power, bloodshed and betrayal.',
      "ytlink": 'https://youtu.be/9Im1q4gvk1M?si=Y39x9-Aq9HIeh4MK',
    },
    {
      "title": "F & F",
      "rating": "IMDb:6",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813538/latest_sy3dbs.jpg',
      "specs": 'Action,Crime : 1hr 46min',
      "description":
          'Los Angeles police officer Brian O Conner must decide where his loyalty really lies '
              'when he becomes enamored with the street racing world he has been sent undercover to end it.',
      "ytlink": 'https://youtu.be/ZsJz2TJAPjw?si=Pa9L8v4ozQ6s8oAE',
    },
    {
      "title": "Bad Boys for Life",
      "rating": "IMDb:3.5",
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813558/MV5BMWU0MGYwZWQtMzcwYS00NWVhLTlkZTAtYWVjOTYwZTBhZTBiXkEyXkFqcGdeQXVyMTkxNjUyNQ_._V1__eg0jl1.jpg',
      "specs": 'Action,Comedy : 2hr 4min',
      "description":
          "Two cops from Miami on a journey to fame, find themselves entangled with a cross border crime syndicate",
      'ytlink': 'https://youtu.be/jKCj3XuPG8M?si=bVducTDFXLgM-Z0P',
    },
    {
      "title": "Avengers infinity war",
      "rating": 'IMDb:8.4',
      "imageUrl":
          "https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813719/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM_._V1__whsrqh.jpg",
      "specs": 'Action,Sci-fi : 2hr 29min',
      "description":
          'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the '
              'powerful Thanos before his blitz of devastation and ruin puts an end to the universe',
      'ytlink': 'https://youtu.be/6ZfuNTqbHE8?si=K5rJ2Z83gtJq9nme',
    },
    {
      "title": 'Batman',
      "rating": 'IMDb:8.2',
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813805/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk_._V1__i5lnt8.jpg',
      "specs": 'Action,Crime : 2hr 20min',
      "description":
          'Batman ventures into Gotham City\'s underworld when a sadistic killer leaves behind a trail of '
              'cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator\'s plans become clear,'
              ' he must forge new relationships, '
              'unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.',
      'ytlink': 'https://youtu.be/mqqft2x_Aa4?si=GPKw34DcwP5W-VJe',
    },
    {
      "imageUrl":
          'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813873/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ_._V1__ambk9z.jpg',
      "title": 'Joker',
      "rating": 'IMDb:8.4',
      "specs": 'Thriller,Crime : 2hr 2min',
      "description":
          'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham'
              ' City while becoming an infamous psychopathic crime figure.',
      'ytlink': 'https://youtu.be/xy8aJw1vYHo?si=jru9psVRDRIJWdC5',
    }
  ];
  List listofUpcomingMovies = [
    {
      "title": "Singham Again ",
      "rating": "PG-13",
      "imageUrl":
          "https://res.cloudinary.com/dyzuqhwps/image/upload/v1719816638/MV5BYzc1Mjk4MGEtNzQzZi00OTY4LTg5ZTgtMjAwZTdjNjg2NjVjXkEyXkFqcGdeQXVyODgzMzg2MDg_._V1__bfj8f2.jpg",
      "specs": "Action, Adventure, Thriller",
      "releaseDate": "31st October 2024",
      "description": "Plot yet to be disclosed.",
      "ytlink": "https://youtu.be/-oYPGmpGKy8?si=ENvp71qW8IBdkNH0"
    },
    {
      "title": "Indian 2",
      "rating": "PG-13",
      "imageUrl":
          "https://res.cloudinary.com/dyzuqhwps/image/upload/v1719817358/MV5BMWQ1MDQ5YzItNTFjNC00YzdiLWFjODktMWNhNmUwMmI0MmU1XkEyXkFqcGdeQXVyMTc5ODIzOTk5._V1__wkz8dy.jpg",
      "specs": "Action, Drama, Thriller :2hr 30 min",
      "releaseDate": "12th July 2024",
      "description":
          "Senapathy, an ex-freedom fighter turned vigilante who fights against corruption. Senapathy returns to the "
              "country to aid a young man who has been exposing corrupt politicians in the country through videos on the internet.",
      "ytlink": "https://youtu.be/Fa_Pvn4hKPc?si=ohCiZ22lNeC_rBPa"
    },
    {
      "title": "Borderlands",
      "rating": "PG-13",
      "imageUrl":
          "https://res.cloudinary.com/dyzuqhwps/image/upload/v1719816908/MV5BOWZmOTM5YmMtNjliMi00OGRkLWIwNGUtNDI2NTE3NzZmMDdmXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_FMjpg_UX1000__txxdir.jpg",
      "specs": "Action,Adventure,Comedy: 1hr 42min",
      "releaseDate": "9th August 2024",
      "description":
          "Returning to her home planet, an infamous outlaw forms an unexpected alliance with a team of unlikely heroes. Together, they battle alien monsters and dangerous bandits to find a missing girl who holds the key to unimaginable power.",
      "ytlink": "https://youtu.be/lU_NKNZljoQ?si=_ZZHL0tFkX-vCwAR"
    }
  ];
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carouselMovieData.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    // Fetch the user's name when the widget is initialized
    fetchname();
    super.initState();
  }

  Future<void> fetchname() async {
    // Replace this with your actual API endpoint
    String url = 'http://10.10.10.136/api/login';
    Dio dio = Dio();
    try {
      var response = await dio.get(url);
      Map<String, dynamic> data = jsonDecode(response.data);

      setState(() {
        name = data['name']; // Assuming the response contains a 'name' field
      });
    } catch (e) {
      log('[e] error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      // brightness: isDark ? Brightness.dark : Brightness.light
    );
    if (_context == null) {
      _context = context;
      //getMovies();
    }
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('data'),backgroundColor: Colors.blueGrey,),
        body: Container(
          color: Colors.black26,
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello ${name ?? ''}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 50, 50),
                              fontSize: 25),
                        ),
                        Text(
                          'Welcome to Xlayer Movies.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          "Book your show, Now!!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => Profile());
                      },
                      child: CircleAvatar(
                        radius: 30,
                        child: Image.network(
                            'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719896311/Char_Profile_Batman_20190116_5c3fc4b40faec2.47318964_auztze.jpg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  child: SearchAnchor(
                    builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: controller,
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                        trailing: <Widget>[],
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      final String query = controller.value.text.toLowerCase();
                      final List filteredMovies = listOfMovies
                          .where((movie) =>
                              movie['title'].toLowerCase().contains(query))
                          .toList();

                      return Future.value(ListView.builder(
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredMovies[index]['title']),
                            onTap: () {
                              setState(() {
                                controller
                                    .closeView(filteredMovies[index]['title']);
                              });
                            },
                          );
                        },
                      ) as FutureOr<Iterable<Widget>>?);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onDoubleTap: () {
                    //getMovies();
                    //getSpots();
                  },
                  child: const Text(
                    'Most Watched Movies',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: CarouselSlider.builder(
                    itemCount: carouselMovieData.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 6),
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Image.network(
                              carouselMovieData[index]['imageUrl'].toString(),
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.5),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  carouselMovieData[index]['title'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Popular Movies',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Get.to(() => allMovies());
                        },
                        child: const Text(
                          'See More >',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 50, 50)),
                        ))
                  ],
                ),
                SizedBox(
                    height: 250,
                    width: 150,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(children: popularMoviesWidget(context)),
                      ),
                    )),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const Text(
                        'Now Showing',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Get.to(allMovies());
                          },
                          child: const Text(
                            'See More >',
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                    height: 250,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(children: MovieDataWidget(context)),
                      ),
                    )),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const Text(
                        'Upcoming',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Get.to(allMovies());
                          },
                          child: const Text(
                            'See More >',
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                    height: 250,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(children: UpcomingMoviesWidget(context)),
                      ),
                    )),
                Center(
                  child: Icon(
                    Icons.more_horiz,
                    color: Color.fromARGB(255, 255, 50, 50),
                    size: 50,
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 60,
          padding: EdgeInsets.only(top: 5),
          color: const Color.fromARGB(255, 29, 29, 29),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage1()));
                  },
                  icon: const Icon(Icons.home, size: 20, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Coming soon",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      fontSize: 20,
                      textColor: Colors.black,
                    );
                  },
                  icon: const Icon(Icons.favorite,
                      size: 20, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Coming soon",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      fontSize: 20,
                      textColor: Colors.black,
                    );
                  },
                  icon: const Icon(Icons.bookmarks,
                      size: 18, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    Get.to(() => Profile());
                  },
                  icon: const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget movieCard({
    required var data,
    required String title,
    required String rating,
    required String imageUrl,
    required String releaseDate,
    required String specs,
    required String description,
    required String ytlink,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: SizedBox(
                  height: 196,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child:
                        //link.isEmpty // ? Image.asset('assets/avengers.jpeg')
                        Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> MovieDataWidget(BuildContext context) {
    List<Widget> movies = [];
    for (int i = 0; i < listOfMovies.length; i++) {
      var v = listOfMovies[i];
      movies.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieInfoDescription(movieData: v)));
        },
        child: movieCard(
            data: v,
            title: v['title'].toString(),
            rating: v['rating'].toString(),
            imageUrl: (v['imageUrl'] != null) ? v['imageUrl'].toString() : '',
            specs: v['Runtime'].toString(),
            releaseDate: v['Release Date'].toString(),
            description: v['description'].toString(),
            ytlink: v['ytlink'].toString()),
      ));
    }
    return movies;
  }

  List<Widget> popularMoviesWidget(BuildContext context) {
    List<Widget> movies = [];
    for (int i = 0; i < listOfPopularMovies.length; i++) {
      var v = listOfPopularMovies[i];
      movies.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieInfoDescription(movieData: v)));
        },
        child: movieCard(
            data: v,
            title: v['title'].toString(),
            rating: v['rating'].toString(),
            imageUrl: (v['imageUrl'] != null) ? v['imageUrl'].toString() : '',
            specs: (v['specs'] != null) ? v['specs'].toString() : '',
            releaseDate: v['Release Date'].toString(),
            description: v['description'].toString(),
            ytlink: v['ytlink'].toString()),
      ));
    }
    return movies;
  }

  List<Widget> carouselWidget(BuildContext context) {
    List<Widget> movies = [];
    for (int i = 0; i < carouselMovieData.length; i++) {
      var v = carouselMovieData[i];
      movies.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieInfoDescription(movieData: v)));
        },
        child: movieCard(
            data: v,
            title: v['title'].toString(),
            rating: v['rating'].toString(),
            imageUrl: (v['imageUrl'] != null) ? v['imageUrl'].toString() : '',
            specs: (v['specs'] != null) ? v['specs'].toString() : '',
            releaseDate: v['Release Date'].toString(),
            description: v['description'].toString(),
            ytlink: v['ytlink'].toString()),
      ));
    }
    return movies;
  }

  List<Widget> UpcomingMoviesWidget(BuildContext context) {
    List<Widget> movies = [];
    for (int i = 0; i < listofUpcomingMovies.length; i++) {
      var v = listofUpcomingMovies[i];
      movies.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UpcomingMovieDescription(movieData: v)));
        },
        child: movieCard(
            data: v,
            title: v['title'].toString(),
            rating: v['rating'].toString(),
            imageUrl: (v['imageUrl'] != null) ? v['imageUrl'].toString() : '',
            specs: (v['specs'] != null) ? v['specs'].toString() : '',
            releaseDate: v['Release Date'].toString(),
            description: v['description'].toString(),
            ytlink: v['ytlink'].toString()),
      ));
    }
    return movies;
  }

  getSpots() async {
    String url = 'http://10.10.10.136/api/login';
    Dio dio = Dio();
    try {
      var response = await dio.get(url);
      Map map = response.data;
      log('[i] movies count ${map['result'].length}');
      for (var book in map['result']) {
        log("[i] book $book");
      }
      // listOfMovies = map['movies'];
      // print(listOfMovies[0]);
      // print(listOfMovies[2]);
      // setState(() {
      // });
      // if(map['status']){
      //   print("Movies data $map");
      // }
    } catch (e) {
      log('[e] error $e');
    }
  }

  getMovies() async {
    String url = 'http://10.10.10.136/api/login';
    Dio dio = Dio();
    try {
      var response = await dio.get(url);
      Map map = jsonDecode(response.data);
      log('[i] movies count ${map['result'].length}');
      for (var book in map['result']) {
        log("[i] book $book");
      }
      // listOfMovies = map['movies'];
      // print(listOfMovies[0]);
      // print(listOfMovies[2]);
      // setState(() {
      // });
      // if(map['status']){
      //   print("Movies data $map");
      // }
    } catch (e) {
      log('[e] error $e');
    }
  }
}
