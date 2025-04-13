import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const InsulinixApp());
}

class InsulinixApp extends StatelessWidget {
  const InsulinixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insulin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}