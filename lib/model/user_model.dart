import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String? name;
  final String email;
  final String fcmtoken;
  final String? imageUrl;

  UserModel({
    required this.uid,
    this.name,
    required this.email,
    required this.fcmtoken,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'fcmtoken': fcmtoken,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      fcmtoken: map['fcmtoken'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
      uid: doc['uid'],
      name: doc['name'],
      email: doc['email'],
      fcmtoken: doc['fcmtoken'],
      imageUrl: doc['imageUrl'],
    );
  }
}
