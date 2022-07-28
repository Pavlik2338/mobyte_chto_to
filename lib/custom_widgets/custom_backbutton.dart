import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final BuildContext contextButton;
  CustomBackButton({required this.contextButton});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pop(contextButton);
      },
      child: const Icon(Icons.arrow_back),
      backgroundColor: Color.fromRGBO(138, 93, 165, 0.5),
    );
  }
}
