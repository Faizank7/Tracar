import 'package:flutter/material.dart';
import 'package:tracar/views/onboarding_screen.dart';
import 'package:tracar/views/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracar',
      home: OnboardingScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      routes: {
        '/login': (context) => LoginScreen(), // Use LoginScreen here
      },
    );
  }
}
