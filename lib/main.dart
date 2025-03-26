import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';  // Import the new login screen
import 'home_page.dart';  // Import the home screen
import 'signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(SmartInsulinApp());
}

class SmartInsulinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartInsulin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: LoginScreen(), // Start with Login screen
      routes: {
        '/dashboard': (context) => HomePage(), // Navigate to Dashboard
        '/signup': (context) => SignUpScreen(), // Navigate to Sign Up
      },
    );
  }
}
