import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/model/user_model.dart';
import 'package:suri/provider/auth/user_info_providers.dart';
import 'package:suri/provider/messaging/messaging_providers.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AuthServices {
  Future<UserCredential?> signInWithGoogle(
      WidgetRef ref, BuildContext context) async {
    final String? fcmtoken =
        await ref.watch(messageServicesProvider).getFCMToken();
    try {
      final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
      if (guser != null) {
        // Obtain auth details from request
        final GoogleSignInAuthentication gAuth = await guser.authentication;

        // Create a new credential for user
        final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );

        // Sign in with Google
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        UserModel newUserData = UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          fcmtoken: fcmtoken!,
          name: userCredential.user!.displayName!,
          imageUrl: userCredential.user!.photoURL.toString(),
          notification: true,
        );

        final DocumentReference docRef =
            _firestore.collection('users').doc(userCredential.user!.uid);

        final DocumentSnapshot docSnapshot = await docRef.get();

        if (docSnapshot.exists) {
          // Document exists, update only necessary fields
          await docRef.update({
            'fcmtoken': fcmtoken,
          });
        } else {
          // Document does not exist, create it

          await docRef.set(newUserData.toMap());
        }

        return userCredential;
      }
      return null;
    } catch (e) {
      await signOutAccount(ref); // Sign out the user

      return null;
    }
  }

  Future<void> signOutAccount(WidgetRef ref) async {
    // Cleaning all listeners to prevent permission denied error when signing out
    ref.invalidate(userInfoProvider);

    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
