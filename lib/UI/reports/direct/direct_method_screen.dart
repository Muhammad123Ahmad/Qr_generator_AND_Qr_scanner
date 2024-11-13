import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class DirectMethodScreen extends StatefulWidget {
  const DirectMethodScreen({super.key});

  @override
  State<DirectMethodScreen> createState() => _DirectMethodScreenState();
}

class _DirectMethodScreenState extends State<DirectMethodScreen> {


  String qrResult = '';
  bool isScanning = false; // To manage QR scanner visibility

  // // To stop the stream of QR scanner when the widget is disposed
  // @override
  // void dispose() {
  //   nameController.dispose();
  //   descriptionController.dispose();
  //   super.dispose();
  // }

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
            if ( qrResult.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.06, left: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
