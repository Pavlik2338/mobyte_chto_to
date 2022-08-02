import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_chto_to/bloc/auth_bloc.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_backbutton.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_button.dart';
import 'package:mobyte_chto_to/custom_widgets/custom_textfield.dart';
import 'package:mobyte_chto_to/resources/enums.dart';

class NewPasswordPage extends StatelessWidget {
  final String email;
  NewPasswordPage({required this.email});
  final AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: Column(
          children: [
            CustomBackButton(contextButton: context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  child: Text(
                    'Create Password',
                    style: TextStyle(
                        color: Color.fromRGBO(27, 27, 27, 1),
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Create your new password to login',
                    style: TextStyle(
                      color: Color.fromRGBO(82, 90, 100, 1),
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                CustomTextField(
                    hintText: 'Password', type: TextFieldType.password),
                CustomTextField(
                    hintText: 'Confirm password',
                    type: TextFieldType.checkPassword),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CustomButton(
                      textButton: 'Create password',
                      colorButton: const Color.fromRGBO(138, 93, 165, 1),
                      onPresed: () {
                        authBloc.add(
                            ResetPasswordEvent(email: email, context: context));
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
