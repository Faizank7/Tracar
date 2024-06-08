import 'dart:async';
import 'package:flutter/material.dart';
import 'vehiclefound_screen.dart';

class FindingYourVehicleScreen extends StatefulWidget {
  @override
  _FindingYourVehicleScreenState createState() => _FindingYourVehicleScreenState();
}

class _FindingYourVehicleScreenState extends State<FindingYourVehicleScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 15 seconds
    Timer(Duration(seconds: 15), () {
      // Navigate to the VehicleFoundScreen after 15 seconds
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => VehicleFoundScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finding Your Vehicle'),
        backgroundColor: Colors.redAccent.shade700, // Set app bar background color
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.redAccent.shade700, Colors.blueAccent.shade700],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4 - 120, // Adjust the top position as needed
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/police_logo.png', // Replace with the path to your background image asset
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2, // Adjust the bottom position as needed
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200, // Adjust width as needed
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.redAccent.shade700, // Set background color
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent.shade700), // Set progress color
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'We are searching for your vehicle...',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
