import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CustomSplashScreen());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomSplashScreen(),
    );
  }
}
