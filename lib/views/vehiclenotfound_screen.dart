import 'package:flutter/material.dart';

class VehicleNotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Status'),
        backgroundColor: Colors.redAccent.shade700, // Set app bar background color to red
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent.shade700, Colors.blueAccent.shade700], // Set linear gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter, // Align the stack to the top center
          children: [
            Positioned(
              top: 50, // Adjust the top position as needed
              child: Image.asset(
                'assets/police_logo.png', // Replace with the path to your background image asset
                width: 200,
                height: 200,
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Vehicle Not Found',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10), // Add some spacing between the texts
                  Text(
                    'Unfortunately, we could not find your vehicle.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20), // Add some spacing before the button
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality to navigate back to the previous screen
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black), // Set background color to black
                      foregroundColor: MaterialStateProperty.all(Colors.white), // Set text color to white
                    ),
                    child: Text('OK'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
