import 'package:cloud_firestore/cloud_firestore.dart';

class UserNameAuth {
  dynamic sheckIn(String email) {
    var snap = FirebaseFirestore.instance
        .collection('users')
        .where("userName", isEqualTo: email)
        .get()
        .toString();
    return snap;
  }
}
