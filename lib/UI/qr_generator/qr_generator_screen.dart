import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscanner/UI/qr_generator/qr_gen_provider.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  //var url = TextEditingController();
  //String qrData = ''; // Default QR data

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => QrGenProvider(),
      child: Consumer<QrGenProvider>(builder: (context,model,child)=>
      
       Scaffold(
        appBar: AppBar(
          title: const Text('Qr Generator'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            
      
            QrImageView(
                  data: model.qrdata,
                  version: QrVersions.auto,
                  size: 200.0,
                  ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.02,
                right: screenWidth * 0.02,
                bottom: screenHeight * 0.06,
              ),
              child: TextFormField(
                controller: model.url,
                decoration: InputDecoration(
                  hintText: 'Enter url or data',
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // setState(() {
                //   qrData = model.url.text; // Update QR data based on input
                // });
                model.UpdateData();
                model.url.clear();
              },
              child: Container(
                height: screenHeight * 0.07,
                width: screenWidth * 0.7,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Generate Qr',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      )
      
     
    );

    
  }
}
