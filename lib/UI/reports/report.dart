import 'package:flutter/material.dart';
import 'package:qrscanner/UI/reports/direct/direct_method_screen.dart';
import 'package:qrscanner/UI/reports/manually/manually_screen.dart';
import 'package:qrscanner/UI/reports/scan_report/scan_report.dart';


class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(title:const  Text('Report'),centerTitle: true,backgroundColor: Colors.teal,),

      body: Padding(
        padding:  EdgeInsets.only(top: screenHeight*0.04,left: screenWidth*0.02,right: screenWidth*0.02),
        child:
        Column(
          children: [

           const Text('Upload Report by any method',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),

           SizedBox(height: screenHeight*0.04),
             Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ManuallyScreen()));
              },
              child: Container(
                height: screenHeight*0.08,
                width: screenWidth*0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:const Icon(Icons.front_hand_sharp),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ScanReportScreen()));
              },
              child: Container(
                height: screenHeight*0.08,
                width: screenWidth*0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:const Icon(Icons.scanner),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectMethodScreen ()));
              },
              child: Container(
                height: screenHeight*0.08,
                width: screenWidth*0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:const Icon(Icons.camera),
              ),
            ),
          ],
        ),

        Padding(
          padding:  EdgeInsets.only(left: screenWidth*0.01,right: screenWidth*0.02),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Manually',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              Text('Scan    ',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              Text('Direct',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ],
          ),
        ),
          ],
        )
      ),

      
    );
  }
}