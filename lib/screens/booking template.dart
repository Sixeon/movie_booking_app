import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ticket extends StatefulWidget {
  const ticket({super.key});

  @override
  State<ticket> createState() => _ticketState();
}

class _ticketState extends State<ticket> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 83, 83, 83)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [Text('data'), Text('data')],
                  ),
                ),
                SizedBox(height: 100,),
                Divider(thickness: 0.5,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
