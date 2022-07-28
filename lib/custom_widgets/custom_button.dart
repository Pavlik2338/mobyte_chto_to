import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final Color? colorButton;
  final Function? onPresed;
  CustomButton(
      {required this.textButton,
      this.colorButton = Colors.white,
      this.onPresed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        onTap: () {
          onPresed;
        },
        child: Container(
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 0.1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 5,
                  spreadRadius: 1)
            ],
            // shape: BoxShape.circle,
          ),
          height: 53,
          width: 328,
          child: Center(child: Text(textButton)),
        ),
      ),
    );
  }
}
