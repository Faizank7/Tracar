import 'package:flutter/material.dart';
import 'dart:async';
import 'policesidechoosevehicle_screen.dart';


class PoliceSideScreen1 extends StatefulWidget {
  @override
  _PoliceSideScreen1State createState() => _PoliceSideScreen1State();
}

class _PoliceSideScreen1State extends State<PoliceSideScreen1> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Color _buttonColor = Colors.red;
  Color _buttonTextColor = Colors.white;
  StreamController<Color> _colorStreamController = StreamController<Color>();
  bool _isRed = true;

  @override
  void initState() {
    super.initState();
    // Start the timer to alternate button colors every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      _colorStreamController.sink.add(_isRed ? Colors.red : Colors.black);
      _isRed = !_isRed;
    });
  }

  @override
  void dispose() {
    _colorStreamController.close(); // Close the stream controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Side Screen'),
        backgroundColor: Colors.redAccent.shade700, // Set app bar background color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.redAccent.shade700, Colors.blueAccent.shade700],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/police_logo.png',
                width: 200,
                height: 200,
                alignment: Alignment.center,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _showInfoDialog(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              StreamBuilder<Color>(
                stream: _colorStreamController.stream,
                initialData: Colors.red,
                builder: (context, snapshot) {
                  return ElevatedButton(
                    onPressed: () {
                      // Implement your login logic here
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                      // For demonstration purposes, just print the credentials
                      print('Username: $username');
                      print('Password: $password');

                      // Navigate to PoliceSideChooseVehicleScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PoliceSideChooseVehicleScreen()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: snapshot.data,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Info'),
          content: Text('Credentials will be provided to you from your office admin.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
