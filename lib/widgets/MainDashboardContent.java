import 'package:flutter/material.dart';

class MainDashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This will be the widget for the main content area
    return Container(
      color: Colors.grey[100], // Example background color
      child: Center(
        child: Text(
          'Main Dashboard Content',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}