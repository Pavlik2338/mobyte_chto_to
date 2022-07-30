import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/models/auth_model.dart';
import 'package:mobyte_chto_to/pages/sing_up_page.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<AuthModel> signIn(
      String email, String password, BuildContext context) async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => const Center(
    //           child: CircularProgressIndicator(),
    //         ));
    AuthModel authModel = AuthModel(isSuccess: false);
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    authModel.isSuccess = true;
    return authModel;
  }

  Future<AuthModel> signUp(
      String email, String password, BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    AuthModel authModel = AuthModel(isSuccess: false);
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    authModel.isSuccess = true;

    return authModel;
  }

  Map<String, dynamic> map() {
    return {
      'userName': usesNameController.toString(),
      'login': loginController.toString(),
    };
  }
}

class AuthException implements Exception {
  final String caption;
  AuthException(this.caption) : super();
}
