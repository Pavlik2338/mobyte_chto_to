import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models/auth_model.dart';

class AuthGoogle {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;

  Future<AuthModel> signIn() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    AuthModel authModel = AuthModel(isSuccess: false);
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    try {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {}
    authModel.isSuccess = true;

    return authModel;
  }

  Future<void> signOut() async {
    googleSignIn.disconnect();
  }
}
