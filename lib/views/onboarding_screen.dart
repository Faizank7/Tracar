import 'package:flutter/material.dart';
import 'package:tracar/views/login_screen.dart'; // Import the login screen file
import 'package:tracar/views/policesidescreen1.dart'; // Import the new screen file

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.redAccent.shade700, Colors.blueAccent.shade700], // Adjust the colors as needed
          ),
        ),
        child: SafeArea(
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoliceSideScreen1()), // Navigate to PoliceSideScreen1
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Circular image box
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                      image: DecorationImage(
                        image: AssetImage('assets/police_logo.png'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Text below the image
                  Text(
                    "Welcome to Tracar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                  SizedBox(height: 10),
                  // Another customizable text below the first one
                  Text(
                    "Find your vehicle here",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Text color
                    ),
                  ),
                  SizedBox(height: 40),
                  // Button at the bottom
                  ElevatedButton(
                    onPressed: () {
                      // Redirect to LoginScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Start Tracing",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Additional text and icon for police representative
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color for the container
                      borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person, // Placeholder icon, replace with your desired icon
                          size: 24,
                          color: Colors.black, // Foreground color for the icon
                        ),
                        SizedBox(width: 8),
                        Text(
                          "If you are a police representative, Tap here",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, // Text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
