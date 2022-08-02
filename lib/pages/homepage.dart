import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  String email = 'dsadaddd';
  String? username;
  HomePage({required this.email, this.username});
  final AuthBloc authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 250,
                    height: 250,
                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    authBloc.add(SingOutEvent(context: context));
                  },
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
