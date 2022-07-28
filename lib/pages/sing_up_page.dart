import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_button.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_textfield.dart';
import 'package:mobyte_chto_to/resources/enums.dart';

import '../custom_widgets/custom_backbutton.dart';

class SingUpPage extends StatelessWidget {
  String txtBefore = '';
  String checkPassword(String password) {
    return txtBefore = password;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomBackButton(
                      contextButton: context,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(120, 40, 95, 0),
                  child: SizedBox(
                    width: 170,
                    height: 170,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ],
            ),
            CustomTextField(hintText: 'Username', type: TextFieldType.login),
            CustomTextField(
                hintText: 'Phone number', type: TextFieldType.phone),
            CustomTextField(
              hintText: 'Password',
              type: TextFieldType.password,
              haveVision: true,
              callback: checkPassword,
            ),
            CustomTextField(
              hintText: 'Confirm password',
              type: TextFieldType.checkPassword,
              haveVision: true,
              txtBefore: txtBefore,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: CustomButton(
                textButton: "Register",
                colorButton: const Color.fromRGBO(138, 93, 165, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
