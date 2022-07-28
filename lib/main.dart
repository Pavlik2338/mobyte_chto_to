import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/pages/new_password.dart';
import 'package:mobyte_chto_to/pages/sing_up_page.dart';
import 'package:mobyte_chto_to/pages/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CustomSplashScreen());
} 
// void main() => runApp(NewPasswordPage());
