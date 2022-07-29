import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/pages/login_page.dart';
import 'package:splashscreen/splashscreen.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  CustomSplashScreenState createState() => CustomSplashScreenState();
}

class CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SplashScreen(
          seconds: 2,
          navigateAfterSeconds: LoginPage(),
          photoSize: 150,
          image: Image.asset(
            "assets/images/logo.png",
            width: 250,
            height: 250,
          ),
          backgroundColor: Colors.white,
          loaderColor: Colors.black,
        ),
      ),
    );
  }
}
