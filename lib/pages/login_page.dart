// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/bloc/auth_bloc.dart';
import 'package:mobyte_chto_to/custom_widgets/apple_signin.dart';
import 'package:mobyte_chto_to/custom_widgets/google_signin.dart';
import 'package:mobyte_chto_to/pages/forgot_passwordpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_chto_to/pages/homepage.dart';
import '../custom_widgets/custom_TextField.dart';
import '../custom_widgets/custom_textbutton.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_divider.dart';
import '../resources/enums.dart';
import 'sing_up_page.dart';

class LoginPage extends StatelessWidget {
  late String email;
  late String password;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = AuthBloc();

    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) =>  HomePage()));
          } else if (state is AuthFail) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                    //child: ,
                    ));
          } else if (state is AuthLoadingState) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
          }
        },
        builder: (context, state) {
          if (state is AuthInitial) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(95, 20, 95, 0),
                  child: SizedBox(
                    width: 170,
                    height: 170,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
                CustomTextField(
                  hintText: "Username or Email ",
                  type: TextFieldType.login,

                  controller: loginController,
                  // // key: loginkey,
                ),
                CustomTextField(
                  hintText: "Password",
                  haveVision: true,
                  type: TextFieldType.password,

                  controller: passwordController,
                  // //key: passwordkey,
                ),
                CustomTextButton(
                  buttonText: "Forgot Password?",
                  navigate: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPage()));
                  },
                ),
                CustomButton(
                    textButton: 'Login',
                    onPresed: () {
                      // Auth().signIn(passwordController.text.trim(),
                      //     loginController.text.trim(), context);
                      authBloc.add(
                        SignInEvent(
                            email: loginController.text,
                            password: passwordController.text,
                            context: context),
                      );
                      print(state);
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style:
                            TextStyle(color: Color.fromRGBO(117, 117, 117, 1)),
                      ),
                      CustomTextButton(
                        buttonText: 'Sign up',
                        navigate: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingUpPage()));
                        },
                      )
                    ],
                  ),
                ),
                CustomDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GoogleSignInButton(
                    onPresed: () {
                      authBloc.add(
                        GoogleSingInEvent(),
                      );
                    },
                  ),
                ),
                AppleSignInButton(),
              ],
            );
          }
          if (state is AuthLoadingState) {
            return Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CircularProgressIndicator(),
                ],
              ),
            );
          }
          return LoginPage();
        },
      )),
    );
  }
}
