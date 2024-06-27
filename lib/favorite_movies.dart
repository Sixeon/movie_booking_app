// // favorite_movies.dart
// import 'package:flutter/material.dart';
//
// class FavoriteMovies extends StatefulWidget {
//   List<Map> get favoriteMovies => _favoriteMovies;
//
//   @override
//   _FavoriteMoviesState createState() => _FavoriteMoviesState();
// }
//
// class _FavoriteMoviesState extends State<FavoriteMovies> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Movies'),
//       ),
//       body: ListView.builder(
//         itemCount: widget.favoriteMovies.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(widget.favoriteMovies[index]['title']),
//           );
//         },
//       ),
//     );
//   }
// }