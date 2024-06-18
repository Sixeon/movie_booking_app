import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class allMovies extends StatelessWidget {
  const allMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          children:  [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.amber),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
          ],
        )
    ),);
  }
}