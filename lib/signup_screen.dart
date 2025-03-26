import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();  // Insulinix ID
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  Future<void> _signUp() async {
    setState(() {
      _errorMessage = null; // Clear any previous errors
    });

    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      setState(() {
        _errorMessage = "Passwords do not match.";
      });
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _idController.text.trim(),  // Treat Insulinix ID as email
        password: _passwordController.text.trim(),
      );

      // If successful, navigate to dashboard
      Navigator.pushReplacementNamed(context, '/dashboard');
    } catch (e) {
      setState(() {
        _errorMessage = "Error creating account: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter your full name";
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Insulinix ID Field
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: "Create Insulinix ID",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.account_circle, color: Colors.blue),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter Insulinix ID";
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter password";
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Confirm Password Field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.blue),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Confirm your password";
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Error Message
              if (_errorMessage != null)
                Text(_errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 14)),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _signUp();
                  }
                },
                child: Text("Submit", style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 10),

              // Add Device Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: () {
                  // TODO: Implement "Add Device" functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Add Device feature coming soon!")),
                  );
                },
                child: Text("Add Device", style: TextStyle(color: Colors.blue)),
              ),

              SizedBox(height: 10),

              // Already Have an Account? Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to Sign-In
                    },
                    child: Text("Sign In", style: TextStyle(color: Colors.blue)),
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
