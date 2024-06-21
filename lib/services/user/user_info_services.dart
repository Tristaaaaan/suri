import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class UserInfoServices {
  Future<void> configureUserNotification(bool notification) async {
    await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .update({"notification": notification});
  }
}
