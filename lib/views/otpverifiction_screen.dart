import 'package:flutter/material.dart';
import 'choosevehicle_screen.dart'; // Adjust the file path as needed

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Verified'),
        backgroundColor: Colors.redAccent.shade700, // Set app bar background color to red accent
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.redAccent.shade700, Colors.blueAccent.shade700], // Set linear red and blue gradient
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/police_logo.png', // Replace with the path to your image asset
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Your account has been verified!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40), // Add space between the text and the button
              ElevatedButton(
                onPressed: () {
                  // Redirect to ChooseVehicleScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseVehicleScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black, // Set text color to white
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
