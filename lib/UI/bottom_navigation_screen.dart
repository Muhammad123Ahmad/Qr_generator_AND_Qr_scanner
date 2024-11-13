import 'package:flutter/material.dart';
import 'package:qrscanner/UI/qr_generator/qr_generator_screen.dart';
import 'package:qrscanner/UI/reports/report.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0; // To track the current active tab

  // Ensure there are two widgets to match the two BottomNavigationBar items
  final List<Widget> _children = [
    const QrGeneratorScreen(),
    const Report(), // Placeholder for "Report" screen
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the index when tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // Display the currently selected screen

      // Bottom navigation bar to switch between tabs
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // Handle tab changes
        currentIndex: _currentIndex, // Set the active tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Gnerate QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Report',
          ),
        ],
      ),
    );
  }
}
