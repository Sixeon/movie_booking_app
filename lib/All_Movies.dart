import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'movie_info_description.dart';
import 'homescreen.dart';


class allMovies extends StatelessWidget {
   allMovies({super.key});
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
      "specs": '',
      "description":
      'A grizzled tank commander makes tough decisions as he and '
          'his crew fight their way across Germany in April, 1945.',
    },
    {
      "title": "John Wick 3",
      "rating": "IMDb:7.4",
      "imageUrl": 'assets/JOHNWICK3.jpeg',
      "specs": '',
      "description":
      'John Wick is on the run after killing a member of the international assassins guild, '
          'and with a '
          '14 million price tag on his head, he is the target of hit men and women everywhere',
    },
    {
      "title": "The Fast and the Furious",
      "rating": "IMDb:6",
      "imageUrl": 'assets/FandF.jpeg',
      "specs": '',
      "description":
      'Los Angeles police officer Brian O Conner must decide where his loyalty really lies '
          'when he becomes enamored with the street racing world he has been sent undercover to end it.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,iconTheme: const IconThemeData(
          color: Colors.white
      ),),
        body: GridView.count(
          crossAxisCount: 2,
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
         ),
       ));
     }
     return movies;
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
           imageUrl: v['imageUrl'].toString(),
           specs: v['specs'].toString(),
           description: v['description'].toString(),
         ),
       ));
     }
     return movies;
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
           children: [
             Card(
               elevation: 6,
               child: SizedBox(
                   height: 159,
                   width: 150,
                   child: Image.asset(
                     imageUrl,fit: BoxFit.fill,
                   )),
             ),
             const SizedBox(
               height: 2,
             ),
             Row(
               children: [
                 const SizedBox(
                   width: 20,
                 ),
                 const Icon(
                   Icons.star,
                   color: Colors.amber,
                   size: 12,
                 ),
                 Text(
                   rating,
                   style: const TextStyle(color: Colors.amber),
                 )
               ],
             )
           ],
         ),
       ),
     );
   }
}
