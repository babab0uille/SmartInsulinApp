import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signin_screen.dart';  // Import the sign-in screen
import 'home_page.dart';  // Import the home screen (dashboard)

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
      home: SignInScreen(), // Start with Sign-In screen
      routes: {
        '/dashboard': (context) => HomePage(), // Navigate to Dashboard/Home
      },
    );
  }
}
