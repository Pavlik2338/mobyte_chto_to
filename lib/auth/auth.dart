// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:mobyte_chto_to/models/auth_model.dart';
import 'package:mobyte_chto_to/models/user_model.dart';
import 'package:mobyte_chto_to/pages/homepage.dart';
import 'package:mobyte_chto_to/auth/username_auth.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<AuthModel> signIn(
      String email, String password, BuildContext context) async {
    AuthModel authModel = AuthModel(isSuccess: false);

    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage(email: email)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        String newEmail = await UserNameAuth().sheckIn(email);
        signIn(newEmail, password, context);
      } else if (e.code == 'wrong-password') {
        const SnackBar(
          content: Text('Wrong password provided for that user.'),
        );
      }
    }
    authModel.isSuccess = true;
    return authModel;
  }

  Future<AuthModel> signUp(String email, String password, String userName,
      BuildContext context) async {
    AuthModel authModel = AuthModel(isSuccess: false);
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(userName);
    final user = UserModel(
      password: password,
      login: email,
    );
    final json = user.toJson();

    try {
      docUser.set(json);
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const SnackBar(
          content: Text('The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        const SnackBar(
          content: Text('The account already exists for that email.'),
        );
      }
    }
    authModel.isSuccess = true;

    return authModel;
  }

  Future<void> signOut(BuildContext context) async {
    await auth.signOut();
    Navigator.pop(context);
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> verify(String code) async {
    User? user = auth.currentUser;
    user!.sendEmailVerification();
    await auth.verifyPasswordResetCode(code);
  }
}

class AuthException implements Exception {
  final String caption;
  AuthException(this.caption) : super();
}
