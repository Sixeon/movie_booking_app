import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:dont_book_my_show/All_Movies.dart';
import 'package:dont_book_my_show/movie_info_description.dart';
import 'package:dont_book_my_show/profile.dart';
import 'package:dont_book_my_show/screens/booking%20template.dart';
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

class HomePage1 extends StatefulWidget {
   HomePage1({super.key});
  bool isDark = false;

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  BuildContext? _context;
  List? listofspots=[];
  List listOfMovies = [
    {
      "title": "Bad Boys for Life",
      "rating": "IMDb:3.5",
      "imageUrl": 'assets/Bad Boys for Life.jpeg',
      "specs": 'Action,Comedy : 2hr 4min',
      "description":
      "Two cops from Miami on a journey to fame, find themselves entangled with a cross border crime syndicate",
    },
    {
      "title": "Avengers",
      "rating": 'IMDb:8.4',
      "imageUrl": "assets/avengers.jpeg",
      "specs": 'Action,Sci-fi : 2hr 29min',
      "description":
      'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the '
          'powerful Thanos before his blitz of devastation and ruin puts an end to the universe',
    },
    {
      "imageUrl": 'assets/Batman.jpeg',
      "title": 'Batman',
      "rating": 'IMDb:8.2',
      "specs": 'Action,Crime : 2hr 20min',
      "description":
      'Batman ventures into Gotham City\'s underworld when a sadistic killer leaves behind a trail of '
          'cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator\'s plans become clear,'
          ' he must forge new relationships, '
          'unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.',
    },
    {
      "imageUrl": 'assets/joker.jpeg',
      "title": 'Joker',
      "rating": 'IMDb:8.4',
      "specs": 'Thriller,Crime : 2hr 2min',
      "description":
      'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham'
          ' City while becoming an infamous psychopathic crime figure.',
    }
  ];
  List listOfPopularMovies = [
    {
      "title": "K.G.F:Chapter 1",
      "rating": "IMDb:8.2",
      "imageUrl": 'assets/KGF.jpeg',
      "specs": 'Action : 2hr 30 min',
      "description":
      'In the 1970s, a gangster named Rocky goes undercover as a slave to '
          'assassinate the owner of a notorious gold mine known as the Kolar Gold Fields',
    },
    {
      "title": "Pathaan",
      "rating": "IMDb:5.8",
      "imageUrl": 'assets/Pathan.jpeg',
      "specs": 'Action,Thriller : 2 hr 01 min',
      "description":
      'An Indian agent races against a doomsday clock as a ruthless mercenary,'
          ' with a bitter vendetta, mounts an apocalyptic attack against the country',
    },
    {
      "title": "Fury",
      "rating": "IMDb:7.6",
      "imageUrl": 'assets/FURY.jpeg',
      "specs": 'Action,War : 2hr 14min',
      "description":
      'A grizzled tank commander makes tough decisions as he and '
          'his crew fight their way across Germany in April, 1945.',
    },
    {
      "title": "John Wick 3",
      "rating": "IMDb:7.4",
      "imageUrl": 'assets/JOHNWICK3.jpeg',
      "specs": 'Action,Thriller : 2hr 11 min',
      "description":
      'John Wick is on the run after killing a member of the international assassins guild, '
          'and with a '
          '14 million price tag on his head, he is the target of hit men and women everywhere',
    },
    {
      "title": "The Fast and the Furious",
      "rating": "IMDb:6",
      "imageUrl": 'assets/FandF.jpeg',
      "specs": 'Action,Crime : 1hr 46min',
      "description":
      'Los Angeles police officer Brian O Conner must decide where his loyalty really lies '
          'when he becomes enamored with the street racing world he has been sent undercover to end it.',
      "yt_link": '',
    },
  ];
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Anurag!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 50, 50),
                              fontSize: 22),
                        ),
                        Text(
                          'Welcome to Xlayer Movies.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                          "Book your show, Now!!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
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
                            'https://static.dc.com/dc/files/default_images/Char_Profile_Batman_20190116_5c3fc4b40faec2.47318964.jpg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SearchAnchor(
                    builder: (BuildContext context, SearchController controller) {
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
                        trailing: <Widget>[
                          // Tooltip(
                          //   message: 'Change brightness mode',
                          //   child: IconButton(
                          //     isSelected: isDark,
                          //     onPressed: () {
                          //       setState(() {
                          //         isDark = !isDark;
                          //       });
                          //     },
                          //     icon: const Icon(Icons.wb_sunny_outlined),
                          //     selectedIcon: const Icon(Icons.brightness_2_outlined),
                          //   ),
                          // )
                        ],
                      );
                    }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }),
                const SizedBox(
                  height: 16,
                ),
                InkWell(

                  onDoubleTap:(){
                    //getMovies();
                    //getSpots();
                  },
                  child: const Text(
                    'Most Watched Movies',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  height: 20,
                  color: Colors.white,
                  thickness: 0.5,
                ),
                Card(
                  elevation: 3,
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: 206,
                        width: 380,
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://cdn.mos.cms.futurecdn.net/5vPndSdDicde7EwTyAtqjk.jpg',
                          ),
                        ),
                      ),
                      Container(
                          height: 160,
                          decoration:
                          const BoxDecoration(color: Colors.transparent),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    children: [
                                      // Text('Batman'),
                                      // Text('The Dark Knight')
                                    ],
                                  ),
                                  TextButton.icon(
                                    icon: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {_launchURL('https://youtu.be/mqqft2x_Aa4?si=4coH-DdPYQ0MayGY');},
                                    label: const Text(
                                      textAlign: TextAlign.center,
                                      'Watch Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Popular Movies',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Get.to(allMovies());
                          Get.to(() => allMovies());
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => allMovies()),
                          );
                        },
                        child: const Text(
                          'See More >',
                          style: TextStyle(
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
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Get.to(allMovies());
                          },
                          child: const Text(
                            'See More >',
                            style: TextStyle(color: Colors.red),
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
                      msg: "coming soon",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
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
                      fontSize: 25,
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

  Widget movieCard(
      {required var data,
        required String title,
        required String rating,
        required String imageUrl,
        required String specs,
        required String description}) {
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
                         Image.asset(
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
                const SizedBox(
                width: 60,
                ),


                Text(
                  title,textAlign: TextAlign.left,
                  style: const TextStyle(
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
          description: v['description'].toString(),
        ),
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
          description: v['description'].toString(),
        ),
      ));
    }
    return movies;
  }

  //getSpots() async {
//     String url = 'http://10.10.10.114/web/spots/images';
//     Dio dio = Dio();
//     try {
//       var response = await dio.get(url);
//       Map map = response.data;
//       log('[i] movies count ${map['result'].length}');
//       for(var book in map['result']){
//         log("[i] book $book");
//       }
//       // listOfMovies = map['movies'];
//       // print(listOfMovies[0]);
//       // print(listOfMovies[2]);
//       // setState(() {
//       // });
//       // if(map['status']){
//       //   print("Movies data $map");
//       // }
//     } catch (e) {
//       log('[e] error $e');
//     }
//   }
//   getMovies() async {
//     String url = 'http://10.10.10.114/web/spots';
//     Dio dio = Dio();
//     try {
//       var response = await dio.get(url);
//       Map map = jsonDecode(response.data);
//       log('[i] movies count ${map['result'].length}');
//       for(var book in map['result']){
//         log("[i] book $book");
//       }
//       // listOfMovies = map['movies'];
//       // print(listOfMovies[0]);
//       // print(listOfMovies[2]);
//       // setState(() {
//       // });
//       // if(map['status']){
//       //   print("Movies data $map");
//       // }
//     } catch (e) {
//       log('[e] error $e');
//     }
//   }
// }
// class SearchBarApp extends StatefulWidget {
//   const SearchBarApp({super.key});
//
//   @override
//   State<SearchBarApp> createState() => _SearchBarAppState();
// }
//
// class _SearchBarAppState extends State<SearchBarApp> {
//   bool isDark = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = ThemeData(
//         useMaterial3: true,
//         brightness: isDark ? Brightness.dark : Brightness.light);
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SearchAnchor(
//           builder: (BuildContext context, SearchController controller) {
//             return SearchBar(
//               controller: controller,
//               padding: const WidgetStatePropertyAll<EdgeInsets>(
//                   EdgeInsets.symmetric(horizontal: 16.0)),
//               onTap: () {
//                 controller.openView();
//               },
//               onChanged: (_) {
//                 controller.openView();
//               },
//               leading: const Icon(Icons.search),
//               trailing: <Widget>[
//                 Tooltip(
//                   message: 'Change brightness mode',
//                   child: IconButton(
//                     isSelected: isDark,
//                     onPressed: () {
//                       setState(() {
//                         isDark = !isDark;
//                       });
//                     },
//                     icon: const Icon(Icons.wb_sunny_outlined),
//                     selectedIcon: const Icon(Icons.brightness_2_outlined),
//                   ),
//                 )
//               ],
//             );
//           }, suggestionsBuilder:
//           (BuildContext context, SearchController controller) {
//         return List<ListTile>.generate(5, (int index) {
//           final String item = 'item $index';
//           return ListTile(
//             title: Text(item),
//             onTap: () {
//               setState(() {
//                 controller.closeView(item);
//               });
//             },
//           );
//         });
//       }),
//     );
//   }
//
}