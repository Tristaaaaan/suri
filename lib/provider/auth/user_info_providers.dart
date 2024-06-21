import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/model/user_model.dart';
import 'package:suri/services/user/user_info_services.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Define a model for the user data
final userInfoProvider =
    StreamProvider.family<UserModel, String>((ref, userId) {
  final document = _firestore.collection("users").doc(userId);
  return document.snapshots().map(
        (snapshot) => UserModel.fromSnapshot(snapshot),
      );
});

final userInfoServicesProvider = Provider<UserInfoServices>((ref) {
  return UserInfoServices();
});

final userNotificationProvider = StateProvider<bool>((ref) => true);
