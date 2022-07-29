import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_chto_to/bloc/auth_bloc.dart';
import 'package:mobyte_chto_to/pages/new_password.dart';
import 'package:mobyte_chto_to/pages/sing_up_page.dart';
import 'package:mobyte_chto_to/pages/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splashscreen/splashscreen.dart';

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
