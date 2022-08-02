import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/bloc/auth_bloc.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_button.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_textfield.dart';
import 'package:mobyte_chto_to/resources/enums.dart';
import 'package:mobyte_chto_to/resources/validate_form.dart';

import '../custom_widgets/custom_backbutton.dart';

TextEditingController loginController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController usesNameController = TextEditingController();
TextEditingController confirmController = TextEditingController();
final keyUsername = GlobalKey<FormState>();
final keyEmail = GlobalKey<FormState>();
final keyPassword = GlobalKey<FormState>();
final keyPasswordConfirm = GlobalKey<FormState>();

class SingUpPage extends StatelessWidget {
  String txtBefore = '';
  String checkPassword(String password) {
    return txtBefore = password;
  }

  final AuthBloc authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          CustomTextField(
            key: keyUsername,
            hintText: 'Username',
            type: TextFieldType.nothing,
            validator: (text) => ValidateForm().validateUsername(text),
            controller: usesNameController,
          ),
          CustomTextField(
            key: keyEmail,
            hintText: 'Email',
            type: TextFieldType.login,
            controller: loginController,
            validator: (text) => ValidateForm().validateEmail(text),
          ),
          CustomTextField(
            key: keyPassword,
            hintText: 'Password',
            type: TextFieldType.password,
            haveVision: true,
            validator: (text) => ValidateForm().validatePassword(text),
            controller: passwordController,
          ),
          CustomTextField(
              key: keyPasswordConfirm,
              hintText: 'Confirm password',
              type: TextFieldType.checkPassword,
              haveVision: true,
              controller: confirmController,
              validator: (text) {
                if (passwordController.text == confirmController.text) {
                  ValidateForm().validatePassword(text);
                } else {
                  return 'Password doesnt math';
                }
                ;
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: CustomButton(
              textButton: "Register",
              colorButton: const Color.fromRGBO(138, 93, 165, 1),
              onPresed: () {
                if (keyUsername.currentState!.validate() &
                    keyPassword.currentState!.validate() &
                    keyEmail.currentState!.validate() &
                    keyPasswordConfirm.currentState!.validate()) {
                  authBloc.add(
                    SignUpEvent(
                        email: loginController.text,
                        password: passwordController.text,
                        context: context,
                        userName: usesNameController.text),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
