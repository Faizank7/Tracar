import 'package:flutter/material.dart';
import 'vehicleinformation_screen.dart'; // Import the VehicleInformationScreen

class ChooseVehicleScreen extends StatefulWidget {
  const ChooseVehicleScreen({Key? key}) : super(key: key);

  @override
  _ChooseVehicleScreenState createState() => _ChooseVehicleScreenState();
}

class _ChooseVehicleScreenState extends State<ChooseVehicleScreen> {
  // Define initial background colors
  Color backgroundColor = Colors.redAccent.shade700;
  Color buttonBackgroundColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Vehicle'),
        backgroundColor: backgroundColor, // Set app bar background color
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            // Change background color to linear gradient
            backgroundColor = Colors.redAccent.shade700;
            buttonBackgroundColor = Colors.black;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.redAccent.shade700, Colors.blueAccent.shade700], // Set linear gradient colors
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 50,
                child: GestureDetector(
                  onTap: () {
                    // Redirect to VehicleInformationScreen for two-wheeler
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VehicleInformationScreen(vehicleType: 'Two Wheeler')),
                    );
                  },
                  child: Image.asset(
                    'assets/police_logo.png', // Replace with the path to your background image asset
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Redirect to VehicleInformationScreen for two-wheeler
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => VehicleInformationScreen(vehicleType: 'Two Wheeler')),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Image.asset(
                                    'assets/two_wheeler-removebg-preview.png', // Replace with the path to your two wheeler image asset
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Redirect to VehicleInformationScreen for two-wheeler
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => VehicleInformationScreen(vehicleType: 'Two Wheeler')),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: buttonBackgroundColor, // Set button background color
                                ),
                                child: Text('Two Wheeler'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Redirect to VehicleInformationScreen for four-wheeler
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => VehicleInformationScreen(vehicleType: 'Four Wheeler')),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Image.asset(
                                    'assets/four_wheeler-removebg-preview (1).png', // Replace with the path to your four wheeler image asset
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Redirect to VehicleInformationScreen for four-wheeler
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => VehicleInformationScreen(vehicleType: 'Four Wheeler')),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: buttonBackgroundColor, // Set button background color
                                ),
                                child: Text('Four Wheeler'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
