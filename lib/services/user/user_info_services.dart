import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class UserInfoServices {
  Future<void> configureUserNotification(
      bool notification, String userId) async {
    await _firestore
        .collection("users")
        .doc(userId)
        .update({"notification": notification});
  }
}
