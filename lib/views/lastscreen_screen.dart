import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Import the flutter_rating_bar package
import 'recoveredvehicle_screen.dart'; // Import the new screen
import 'login_screen.dart'; // Import the login screen

class LastScreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanks'),
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
              top: 30, // Adjust the top position as needed
              child: Image.asset(
                'assets/police_logo.png', // Replace with the path to your background image asset
                width: 200,
                height: 200,
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 220), // Add padding between the background image and the text
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0), // Add vertical padding
                      child: Text(
                        'Thank you!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10), // Add some spacing between the texts
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical padding
                      child: Text(
                        'We are here for your assistance',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10), // Add some spacing between the texts
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical padding
                      child: Text(
                        'Kindly rate us ',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    RatingBar.builder( // Add RatingBar widget for star rating
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 30.0,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // Implement your rating update logic here
                      },
                    ),
                    SizedBox(height: 20), // Add spacing between the rating and the logout button
                    TextButton( // Add a logout button
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()), // Redirect to login_screen.dart
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black), // Set background color to black
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white, // Set text color to white
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
