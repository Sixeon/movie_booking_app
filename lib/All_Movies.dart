import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'movie_info_description.dart';
import 'homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';



class allMovies extends StatelessWidget {
   allMovies({super.key});
   // List listOfMovies = [
   //
   // ];
   List listOfPopularMovies = [
     {
       "title": "Kalki 2898 AD",
       "rating": "IMDb:9.3",
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813157/kalki_2898_ad_jaluls.jpg',
       "specs": 'Action : 2hr 30 min',
       "description":
       'A modern-day avatar of Vishnu, a Hindu god, who is believed '
           'to have descended to earth to protect the world from evil forces.',
       'ytlink':'https://youtu.be/kQDd1AhGIHk?si=x5Uk4xL2tzUo9RVE',
     },
     {
       "title": "K.G.F:Chapter 1",
       "rating": "IMDb:8.2",
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813367/f5a21f64af7359f7aaa7c29dee8a12a97630e707cdbf71e0ae6b063322fb8575_xmvuyb.jpg',
       "specs": 'Action : 2hr 30 min',
       "description":
       'In the 1970s, a gangster named Rocky goes undercover as a slave to '
           'assassinate the owner of a notorious gold mine known as the Kolar Gold Fields',
       'ytlink':'https://youtu.be/-KfsY-qwBS0?si=J2otMdb66PBz1gyQ',
     },
     {
       "title": "Pathaan",
       "rating": "IMDb:5.8",
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813408/pathaan_adfcih.jpg',
       "specs": 'Action,Thriller : 2 hr 01 min',
       "description":
       'An Indian agent races against a doomsday clock as a ruthless mercenary,'
           ' with a bitter vendetta, mounts an apocalyptic attack against the country',
       'ytlink':'https://youtu.be/vqu4z34wENw?si=96oukwpJS1gyAro1',
     },
     {
       "title": "Fury",
       "rating": "IMDb:7.6",
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719812349/fury_ver6_pt3yaj.jpg',
       "specs": 'Action,War : 2hr 14min',
       "description":
       'A grizzled tank commander makes tough decisions as he and '
           'his crew fight their way across Germany in April, 1945.',
       'ytlink':'https://youtu.be/q94n3eWOWXM?si=tIcuXBZptmiwdICI',
     },
     {
       "title": "John Wick 3",
       "rating": "IMDb:7.4",
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813504/MV5BMDg2YzI0ODctYjliMy00NTU0LTkxODYtYTNkNjQwMzVmOTcxXkEyXkFqcGdeQXVyNjg2NjQwMDQ_._V1_FMjpg_UX1000__tfaqg9.jpg',
       "specs": 'Action,Thriller : 2hr 11 min',
       "description":
       'John Wick is on the run after killing a member of the international assassins guild, '
           'and with a '
           '14 million price tag on his head, he is the target of hit men and women everywhere',
       'ytlink':'https://youtu.be/M7XM597XO94?si=Wxpm-2zbRUDTgsJJ',
     },
     {
       "title": "The Fast and the Furious",
       "rating": "IMDb:6",
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813538/latest_sy3dbs.jpg',
       "specs": 'Action,Crime : 1hr 46min',
       "description":
       'Los Angeles police officer Brian O Conner must decide where his loyalty really lies '
           'when he becomes enamored with the street racing world he has been sent undercover to end it.',
       "ytlink": 'https://youtu.be/ZsJz2TJAPjw?si=Pa9L8v4ozQ6s8oAE',
     },
     {
       "title": "Bad Boys for Life",
       "rating": "IMDb:3.5",
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813558/MV5BMWU0MGYwZWQtMzcwYS00NWVhLTlkZTAtYWVjOTYwZTBhZTBiXkEyXkFqcGdeQXVyMTkxNjUyNQ_._V1__eg0jl1.jpg',
       "specs": 'Action,Comedy : 2hr 4min',
       "description":
       "Two cops from Miami on a journey to fame, find themselves entangled with a cross border crime syndicate",
       'ytlink':'https://youtu.be/jKCj3XuPG8M?si=bVducTDFXLgM-Z0P',
     },
     {
       "title": "Avengers infinity war",
       "rating": 'IMDb:8.4',
       "imageUrl": "https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813719/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM_._V1__whsrqh.jpg",
       "specs": 'Action,Sci-fi : 2hr 29min',
       "description":
       'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the '
           'powerful Thanos before his blitz of devastation and ruin puts an end to the universe',
       'ytlink':'https://youtu.be/6ZfuNTqbHE8?si=K5rJ2Z83gtJq9nme',
     },
     {
       "title": 'Batman',
       "rating": 'IMDb:8.2',
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813805/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk_._V1__i5lnt8.jpg',
       "specs": 'Action,Crime : 2hr 20min',
       "description":
       'Batman ventures into Gotham City\'s underworld when a sadistic killer leaves behind a trail of '
           'cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator\'s plans become clear,'
           ' he must forge new relationships, '
           'unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.',
       'ytlink':'https://youtu.be/mqqft2x_Aa4?si=GPKw34DcwP5W-VJe',
     },
     {
       "imageUrl": 'https://res.cloudinary.com/dyzuqhwps/image/upload/v1719813873/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ_._V1__ambk9z.jpg',
       "title": 'Joker',
       "rating": 'IMDb:8.4',
       "specs": 'Thriller,Crime : 2hr 2min',
       "description":
       'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham'
           ' City while becoming an infamous psychopathic crime figure.',
       'ytlink':'https://youtu.be/xy8aJw1vYHo?si=jru9psVRDRIJWdC5',
     }
   ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,iconTheme: const IconThemeData(
          color: Colors.white
      ),),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 0.1,
          childAspectRatio: 0.8,
          children: popularMoviesWidget(context),

        ),


    ),);

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
           title: (v['title']!=null)? v['title'].toString():'',
           rating: (v['rating'] !=null)? v['rating'].toString() :'',
           imageUrl: (v['imageUrl'] !=null) ? v['imageUrl'].toString() : '',
           specs: (v['specs'] != null) ? v['specs'].toString() : '',
           description: (v['description']!=null)? v['description'].toString():'',
           ytlink: v['ytlink'].toString(),
         ),
       ));
     }
     return movies;
   }
   // List<Widget> MovieDataWidget(BuildContext context) {
   //   List<Widget> movies = [];
   //   for (int i = 0; i < listOfMovies.length; i++) {
   //     var v = listOfMovies[i];
   //     movies.add(InkWell(
   //       onTap: () {
   //         Navigator.of(context).push(MaterialPageRoute(
   //             builder: (context) => MovieInfoDescription(movieData: v)));
   //       },
   //       child: movieCard(
   //         data: v,
   //         title: v['title'].toString(),
   //         rating: v['rating'].toString(),
   //         imageUrl: v['imageUrl'].toString(),
   //         specs: v['specs'].toString(),
   //         description: v['description'].toString(),
   //         ytlink: v['ytlink'].toString(),
   //       ),
   //     ));
   //   }
   //   return movies;
   }
   Widget movieCard(
       {required var data,
         required String title,
         required String rating,
         required String imageUrl,
         required String specs,
         required String description,
       required String ytlink,}) {
     return Padding(
       padding: const EdgeInsets.all(16.0),
       child: Container(
         height: 250,
         decoration: BoxDecoration(
             color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
         child: Column(

           children: [

             Card(
               elevation: 10,
               child: SizedBox(
                   height: 200,
                   width: 160,
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
                 const SizedBox(
                   width: 30,
                 ),

               ],
             )
           ],
         ),
       ),
     );
   }

