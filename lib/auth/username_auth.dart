import 'package:cloud_firestore/cloud_firestore.dart';

class UserNameAuth {
  Future<String> sheckIn(String username) async {
    var snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(username)
        .get();
    // .toString();
    return await snap.get('email');
  }
}
