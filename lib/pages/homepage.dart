import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 96),
            Padding(
              padding: const EdgeInsets.only(bottom: 41),
              child: Image.asset(
                "assets/images/logo.png",
                width: 250,
                height: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
