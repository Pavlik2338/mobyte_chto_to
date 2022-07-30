import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  late final String buttonText;
  final VoidCallback navigate;
  CustomTextButton({required this.buttonText, required this.navigate});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: TextButton(
          onPressed: navigate,
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Color.fromRGBO(138, 93, 165, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito'),
          ),
        ),
      ),
    );
  }
}
