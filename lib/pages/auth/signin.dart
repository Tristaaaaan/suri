import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/pages/auth/signin_or_signup.dart';

class Signin extends ConsumerWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            ref.read(signInOrSignUpProvider.notifier).state = false;
          },
          child: const Text("SignUp"),
        ),
      ),
    );
  }
}
