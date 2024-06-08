import 'package:flutter/material.dart';
import 'lastscreen_screen.dart';

class RecoveredVehicleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy vehicle information
    List<String> vehicleInformation = [
      'Number Plate: XYZ-123',
      'Engine Number: ---------------------------',
      'Chassis Number: ---------------------------',
      'Make: Your make',
      'Model: Your model',
      'Variant: Your variant',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Recovered Vehicle'),
        backgroundColor: Colors.redAccent.shade700, // Set app bar background color to red
      ),
      body: SingleChildScrollView(
        child: Container(
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
              Padding(
                padding: const EdgeInsets.only(top: 270.0), // Increase the top padding to move the text further down
                child: Text(
                  'Here is the information we found:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 320.0), // Increase the top padding to move the card further down
                  child: Card(
                    color: Colors.transparent, // Set card background color to transparent
                    elevation: 5, // Add elevation for shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Set card border radius
                      side: BorderSide(color: Colors.black, width: 5.5), // Set card border color and width
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0), // Add padding inside the card
                      child: Table(
                        defaultColumnWidth: FlexColumnWidth(1), // Set columns to evenly distribute width
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        border: TableBorder.all(color: Colors.black, width: 0.5), // Decrease border width
                        children: vehicleInformation
                            .map((info) => TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                color: Colors.grey.withOpacity(0.5), // Set grey background color with opacity
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  info.split(':')[0], // Get text before ":"
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                color: Colors.white70.withOpacity(0.5), // Set white background color with opacity
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  info.split(':')[1], // Get text after ":"
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 620.0), // Adjust the top padding for the location text
                child: Text(
                  'Location:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 650.0), // Adjust the top padding for the map integration
                child: Container(
                  height: 200, // Adjust height as needed
                  color: Colors.white, // Set map container background color
                  // Add map widget here
                  child: Center(
                    child: Text(
                      'Map',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 880.0), // Adjust the top padding for the next button
                child: SizedBox(
                  width: 150, // Set the width of the button
                  height: 50, // Set the height of the button
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25), // Round the button borders
                    child: Container(
                      color: Colors.black, // Set button background color
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LastScreenScreen()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
