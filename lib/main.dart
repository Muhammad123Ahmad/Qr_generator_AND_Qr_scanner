import 'package:flutter/material.dart';
import 'package:qrscanner/UI/bottom_navigation_screen.dart';
//import 'package:qrscanner/UI/qr_generator/qr_generator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const BottomNavigationScreen(),
    );
  }
}
