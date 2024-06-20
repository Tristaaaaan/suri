import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suri/pages/auth/signin_or_signup.dart';
import 'package:suri/pages/auth/verify_account.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return const VerifyEmailPage();
          } else {
            return const SignInOrSignUp();
          }
          //user not logged in
        },
      ),
    );
  }
}
