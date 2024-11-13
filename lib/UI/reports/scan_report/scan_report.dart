
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';




// class ScanReportScreen extends StatefulWidget {
//   const ScanReportScreen({super.key});

//   @override
//   State<ScanReportScreen> createState() => _ScanReportScreenState();
// }



// class _ScanReportScreenState extends State<ScanReportScreen> {
//   final nameController = TextEditingController();
//   final descriptionController = TextEditingController();


//   String name = '';
//   String description = '';
//   String qrResult = '';
 
//  Future <void> scanQr() async{
  
  
// }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
    
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Data'),
//         centerTitle: true,
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: screenHeight * 0.06, left: screenWidth * 0.03),
//               child: const Text('Name', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.02, right: screenWidth * 0.02),
//               child: TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Name',
//                   hintStyle: const TextStyle(color: Colors.blueGrey),
//                   fillColor: Colors.white,
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.03),
//               child: const Text('Description', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.02, right: screenWidth * 0.02),
//               child: TextFormField(
//                 controller: descriptionController,
//                 maxLines: 4,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Description',
//                   hintStyle: const TextStyle(color: Colors.blueGrey),
//                   fillColor: Colors.white,
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.03),
//               child: const Text('Scan QR', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
//             ),
//             GestureDetector(
//               onTap:scanQr , 
//               child: Padding(
//                 padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenHeight * 0.02),
//                 child: Container(
//                   height: screenHeight * 0.15,
//                   width: screenWidth * 0.4,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Icon(
//                       Icons.qr_code,
//                       size: screenHeight * 0.1,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.06),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   name = nameController.text.toString();
//                   description = descriptionController.text.toString();
//                 });
//                 nameController.clear();
//                 descriptionController.clear();
//               },
//               child: Center(
//                 child: Container(
//                   height: screenHeight * 0.06,
//                   width: screenWidth * 0.5,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.teal,
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Show Data',
//                       style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (name.isNotEmpty && description.isNotEmpty ) ...[
//               Padding(
//                 padding: EdgeInsets.only(top: screenHeight * 0.06, left: screenWidth * 0.06),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Name: $name',
//                       style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       'Description: $description',
//                       style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
//                     ),

//                      Text(
//                       'Qr Data: $qrResult',
//                       style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(height: 10),
                    
//                   ],
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanReportScreen extends StatefulWidget {
  const ScanReportScreen({super.key});

  @override
  State<ScanReportScreen> createState() => _ScanReportScreenState();
}

class _ScanReportScreenState extends State<ScanReportScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  String name = '';
  String description = '';
  String qrResult = '';
  bool isScanning = false; // To manage QR scanner visibility

  // To stop the stream of QR scanner when the widget is disposed
  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void scanQr() {
    setState(() {
      isScanning = true; // Show the QR scanner
    });
  }

  void stopScanning() {
    setState(() {
      isScanning = false; // Hide the QR scanner
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
              child: const Text('Scan QR', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            GestureDetector(
              onTap: scanQr, // Call scanQr on tap
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
                      Icons.qr_code,
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
            // Show scanned QR result
            if (name.isNotEmpty || description.isNotEmpty || qrResult.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.06, left: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (name.isNotEmpty)
                      Text(
                        'Name: $name',
                        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    if (description.isNotEmpty)
                      Text(
                        'Description: $description',
                        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    if (qrResult.isNotEmpty)
                      Text(
                        'QR Data: $qrResult',
                        style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
            // QR Scanner widget
            if (isScanning)
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.02, top: screenHeight * 0.02),
                child: Container(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: MobileScanner(
                    onDetect: (BarcodeCapture barcode) {
                      setState(() {
                        qrResult = barcode.barcodes[0].rawValue ?? ''; // Accessing the raw value of the first detected barcode
                        stopScanning(); // Stop scanning after detection
                      });
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
