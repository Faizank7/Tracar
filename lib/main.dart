import 'package:flutter/material.dart';
import 'package:tracar/views/onboarding_screen.dart';
import 'package:tracar/views/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracar',
      initialRoute: '/', // Set initial route to '/'
      routes: {
        '/': (context) => OnboardingScreen(), // Set '/' route to OnboardingScreen
        '/login': (context) => LoginScreen(), // Set '/login' route to LoginScreen
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
    );
  }
}
