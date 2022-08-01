import 'package:flutter/material.dart';

import '../custom_widgets/custom_backbutton.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_textfield.dart';
import '../resources/enums.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPassword extends StatefulWidget {
  String email;
  ResetPassword({required this.email});
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
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
                  'Enter Verification Code',
                  style: TextStyle(
                      color: Color.fromRGBO(27, 27, 27, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      fontFamily: 'Nunito'),
                ),
                Text(
                  'Enter code that we have sent to your email \n ${widget.email}',
                  style: const TextStyle(
                      color: Color.fromRGBO(117, 117, 117, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'Nunito'),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) {},
                    backgroundColor: Color.fromRGBO(241, 244, 250, 1),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 14),
                  child: CustomButton(
                    textButton: "Verify",
                    colorButton: const Color.fromRGBO(138, 93, 165, 1),
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
