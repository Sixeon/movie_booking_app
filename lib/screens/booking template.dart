import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    children: [Text('The BATMAN',textAlign:TextAlign.left,style:  TextStyle(fontSize: 20),), Text('data')],
                  ),
                ),
                SizedBox(height: 70,),
                Divider(thickness: 1,),
                
                Align(alignment: Alignment.topCenter,
                  child: Row(children: [Icon(Icons.location_pin,size: 30,),
                    Text("Rupasi Cinema hall",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)],) ,
                ),
                Align(alignment:Alignment.topCenter,
                child: Row(children: [Text("Agartala,Tripura")],),),
                
                SizedBox(height: 50,),
                Divider(thickness: 1,)

              ],

            ),


          ),
        ),
      ),
    );
  }
}
