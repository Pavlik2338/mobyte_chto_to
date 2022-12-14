import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_backbutton.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_textfield.dart';
import 'package:mobyte_chto_to/pages/reset_password_page.dart';
import 'package:mobyte_chto_to/resources/enums.dart';

import '../custom_widgets/custom_button.dart';

class ForgotPage extends StatelessWidget {
  TextEditingController loginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 145),
                  child: CustomBackButton(contextButton: context),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                      color: Color.fromRGBO(27, 27, 27, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      fontFamily: 'Nunito'),
                ),
                const Text(
                  'No worries, you just need to type your \n phone number or username and we will\n send the verification code',
                  style: TextStyle(
                      color: Color.fromRGBO(117, 117, 117, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'Nunito'),
                ),
                CustomTextField(
                  hintText: 'Reset my password',
                  type: TextFieldType.nothing,
                  controller: loginController,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 14),
                  child: CustomButton(
                    textButton: "Register",
                    colorButton: const Color.fromRGBO(138, 93, 165, 1),
                    onPresed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword(
                                    email: loginController.text,
                                  )));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
