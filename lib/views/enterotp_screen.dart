import 'package:flutter/material.dart';
import 'otpverifiction_screen.dart'; // Import the OtpVerificationScreen

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
        centerTitle: true, // Center align the app bar title
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/police_logo.png', // Replace with the path to your image asset
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  labelText: 'OTP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // Set text color to white
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to OtpVerificationScreen when "Verify" button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpVerificationScreen()),
                  );
                },
                child: Text(
                  'Verify',
                  style: TextStyle(color: Colors.white), // Set text color to white
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Set button background color to black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
