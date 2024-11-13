
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import for File

class ManuallyScreen extends StatefulWidget {
  const ManuallyScreen({super.key});

  @override
  State<ManuallyScreen> createState() => _ManuallyScreenState();
}

class _ManuallyScreenState extends State<ManuallyScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  String name = '';
  String description = '';
  XFile? imageFile; // To store the image file

  final ImagePicker _picker = ImagePicker(); // Initialize the image picker

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image; // Update the state with the selected image
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.06, left: screenWidth * 0.03),
              child: const Text('Name', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.02, right: screenWidth * 0.02),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.03),
              child: const Text('Description', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.02, right: screenWidth * 0.02),
              child: TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.03),
              child: const Text('Upload Report', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            GestureDetector(
              onTap: _pickImage, // Call the image picking method
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenHeight * 0.02),
                child: Container(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: screenHeight * 0.1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            GestureDetector(
              onTap: () {
                setState(() {
                  name = nameController.text.toString();
                  description = descriptionController.text.toString();
                });
                nameController.clear();
                descriptionController.clear();
              },
              child: Center(
                child: Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.teal,
                  ),
                  child: const Center(
                    child: Text(
                      'Show Data',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            if (name.isNotEmpty && description.isNotEmpty && imageFile !=null) ...[
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.06, left: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: $name',
                      style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Description: $description',
                      style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                    ),

                    const Text(
                      'Uploaded Image:',
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Image.file(
                      File(imageFile!.path),
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
