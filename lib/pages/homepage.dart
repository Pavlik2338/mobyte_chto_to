// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/bloc/auth_bloc.dart';
import 'package:mobyte_chto_to/pages/forgot_passwordpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashscreen/splashscreen.dart';
import '../custom_widgets/custom_TextField.dart';
import '../custom_widgets/custom_textbutton.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_divider.dart';
import '../resources/enums.dart';
import 'sing_up_page.dart';

final GlobalKey<FormState> loginkey = GlobalKey<FormState>();
final GlobalKey<FormState> passwordkey = GlobalKey<FormState>();

class HomePage extends StatelessWidget {
  late String email;
  late String password;
  late AuthBloc bloc;
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void keepLogin(String addEmail) {
    loginController.text = addEmail;
  }

  void keepPassword(String addPassword) {
    passwordController.text = addPassword;
  }

  @override
  Widget build(BuildContext context) {
    // final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return MaterialApp(
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: Scaffold(
            body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              if (state is StateError) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorText)));
              }
              // if (state.success) {
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => Pagereg(name: loginController.text)));
              // }
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
                    callback: keepLogin,
                    controller: loginController,
                    key: loginkey,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    haveVision: true,
                    type: TextFieldType.password,
                    callback: keepPassword,
                    controller: passwordController,
                    key: passwordkey,
                  ),
                  CustomTextButton(
                    buttonText: "Forgot Password?",
                    navigate: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPage()));
                    },
                  ),
                  CustomButton(
                      textButton: 'Login',
                      onPresed: () {
                        context.read<AuthBloc>().add(
                              SingUpEvent(
                                  email: loginController.text,
                                  password: passwordController.text),
                            );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(
                              color: Color.fromRGBO(117, 117, 117, 1)),
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
                ],
              );
            }
            if (state is LoadingState) {
              return SplashScreen();
            }
            return HomePage();
          },
        )),
      ),
    );
  }
}
