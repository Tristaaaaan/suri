import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/components/snackbar/information_snackbar.dart';
import 'package:suri/model/user_model.dart';
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

        print("FCM token: $fcmtoken");

        UserModel newUserData = UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          fcmtoken: fcmtoken!,
          name: userCredential.user!.displayName!,
          imageUrl: userCredential.user!.photoURL.toString(),
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

          print("creating new user");
          await docRef.set(newUserData.toMap());
        }

        return userCredential;
      }
      return null;
    } catch (e) {
      print("Error: $e");
      await signOut(); // Sign out the user
      if (context.mounted) {
        informationSnackBar(
          context,
          Icons.info_outline,
          'Email domain is not allowed.',
        );
      }
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
