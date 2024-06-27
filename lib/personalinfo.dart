import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set initial values (you can load these from a database or API)
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
        color: Colors.black, // Set background color to black
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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save action (e.g., save to database or API)
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
      style: TextStyle(color: Colors.white), // Set text color to white
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white), // Set label text color to white
        border: OutlineInputBorder(),
      ),
    );
  }
}
