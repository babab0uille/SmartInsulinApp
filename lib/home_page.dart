import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title with cursive font
              Text(
                'Insulinix',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DancingScript', // Custom cursive font
                  color: Colors.blue[800], // Dark blue
                ),
              ),

              SizedBox(height: 5),

              // Subtitle
              Text(
                'An Automated Insulin System',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                ),
              ),

              SizedBox(height: 40),

              // Sign Up Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Icon(Icons.person_add, color: Colors.white),
                label: Text(
                  'User Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  // TODO: Navigate to Sign Up Page
                },
              ),

              SizedBox(height: 20),

              // Sign In Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White background
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.blue), // Blue border
                  ),
                ),
                icon: Icon(Icons.login, color: Colors.blue),
                label: Text(
                  'User Sign In',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  // TODO: Navigate to Sign In Page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
