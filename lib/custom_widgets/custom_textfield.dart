import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/resources/enums.dart';
import 'package:mobyte_chto_to/resources/validators.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  bool haveVision;
  TextFieldType type;
  final Function? callback;
  final String? txtBefore;
  TextEditingController? controller;
  final GlobalKey<FormState>? key;
  final String? Function(String?)? validator;
  CustomTextField(
      {required this.hintText,
      required this.type,
      this.haveVision = false,
      this.callback,
      this.txtBefore,
      this.controller,
      this.key,
      this.validator});
  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late bool vision;

  @override
  void initState() {
    vision = widget.haveVision;
  }

  Icon iconOpenEye = const Icon(
    Icons.remove_red_eye,
    color: Color.fromRGBO(138, 93, 165, 1),
  );
  Icon iconClosedEye = const Icon(CupertinoIcons.eye_slash,
      color: Color.fromRGBO(138, 93, 165, 1));
  Icon icons = const Icon(CupertinoIcons.eye_slash,
      color: Color.fromRGBO(138, 93, 165, 1));
  changeIcon() {
    if (vision == false) {
      icons = iconOpenEye;
    } else if (vision == true) {
      icons = iconClosedEye;
    }
  }

  String? currentText = null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
      child: TextFormField(
        controller: widget.controller,
        // key: widget.key,
        validator: widget.validator,
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
          widget.callback!(widget.controller);
        },
        onChanged: (String str) {
          setState(() {
            currentText = str;
          });
        },
        obscureText: vision,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(138, 93, 165, 1), width: 1.5),
          ),
          suffixIcon: widget.haveVision == true
              ? (IconButton(
                  icon: icons,
                  onPressed: () {
                    setState(() {
                      vision = !vision;
                      changeIcon();
                    });
                  },
                ))
              : (null),
          labelText: widget.hintText,
          filled: true,
          fillColor: const Color.fromARGB(2, 28, 28, 233),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          // errorText: (currentText != null)
          //     ? Validators().valid(
          //         widget.type, widget.controller!.text, widget.txtBefore)
          //     : (null),     ???????????? ???? ??????????
        ),
      ),
    );
  }
}
