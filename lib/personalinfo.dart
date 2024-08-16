import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController _messageController=TextEditingController();

  var channel= WebSocketChannel.connect(Uri.parse("ws://echo.websocket.org/"));
  @override
  void initState() {
    super.initState();

    nameController.text = "John Doe";
    emailController.text = "johndoe@example.com";
    phoneController.text = "123-456-7890";
    addressController.text = "123 Main St, Anytown, USA";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),

      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            _buildTextField(label: 'Name', controller: nameController),
            SizedBox(height: 10),
            _buildTextField(label: 'Email', controller: emailController),
            SizedBox(height: 10),
            _buildTextField(label: 'Phone Number', controller: phoneController),
            SizedBox(height: 10),
            _buildTextField(label: 'Address', controller: addressController),
            SizedBox(height: 20),
            TextFormField(controller: _messageController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(

              labelText: 'name'

            ),),
            StreamBuilder(stream: channel.stream,
                builder: (context,snapshot) {
              if(snapshot.hasError){
                return Text('Error: ${snapshot.error}',style: TextStyle(color: Colors.white),);
              }
              if(snapshot.hasData){
                return Text('Recieved:${snapshot.data}',style: TextStyle(color: Colors.white));
              }
              return const CircularProgressIndicator();
                }),
            FloatingActionButton(
              backgroundColor: Colors.white,
                onPressed: (){
              channel.sink.add(_messageController.text);
            },
              child: Icon(Icons.add)),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Success',
                    'Personal information updated successfully',
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                  );
                },
                child: Text('Save',style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
      ),
    );
  }
}



// GestureDetector(
//     onTap: () async {
//       DateTimeRange? result = await showDateRangePicker(
//           context: context,
//           firstDate: DateTime(2021),
//           lastDate: DateTime(2101));
//       currentDate:
//       DateTime.now();
//       saveText:
//       'Done';
//
//       if (result != null) {
//         startdate = result.start.millisecondsSinceEpoch * 1000;
//         enddate = result.end.millisecondsSinceEpoch * 1000;
//         tran.clear();
//         setState(() {
//           _dateRange = result;
//           transaction();
//         });
//       } else {
//         Toaster.e(context, message: 'DateRange is not selected');
//       }
//     },
//     child: const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Icon(
//         Icons.date_range,
//         color: Colors.white,
//         size: 26,
//       ),
//     ))
