import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/bloc/auth_bloc.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_button.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_textfield.dart';
import 'package:mobyte_chto_to/resources/enums.dart';

import '../custom_widgets/custom_backbutton.dart';

TextEditingController loginController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController usesNameController = TextEditingController();
TextEditingController confirmController = TextEditingController();

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
            hintText: 'Username',
            type: TextFieldType.nothing,
            controller: usesNameController,
          ),
          CustomTextField(
            hintText: 'Email',
            type: TextFieldType.login,
            controller: loginController,
          ),
          CustomTextField(
            hintText: 'Password',
            type: TextFieldType.password,
            haveVision: true,
            controller: passwordController,
          ),
          CustomTextField(
            hintText: 'Confirm password',
            type: TextFieldType.checkPassword,
            haveVision: true,
            txtBefore: passwordController.text,
            controller: confirmController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: CustomButton(
              textButton: "Register",
              colorButton: const Color.fromRGBO(138, 93, 165, 1),
              onPresed: () {
                authBloc.add(
                  SignUpEvent(
                      email: loginController.text,
                      password: passwordController.text,
                      context: context,
                      userName: usesNameController.text),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
