import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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
    List allUser = [];
    var getUser = await FirebaseFirestore.instance.collection('users').get();
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(
          '------------------------------------------------------------------------------------------------------------------------------------------d');
      print(email);
      // ignore: use_build_context_synchronously
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => HomePage(email: email)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');
        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');
        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');
        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');
        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');

        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');
        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');
        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');
        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');

        print(
            '------------------------------------------------------------------------------------------------------------------------------------------d');
        String newEmail = UserNameAuth().sheckIn(email);
        print(newEmail);
        signIn(newEmail, password, context);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
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
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    authModel.isSuccess = true;

    return authModel;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

class AuthException implements Exception {
  final String caption;
  AuthException(this.caption) : super();
}
