import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/pages/auth/signin.dart';
import 'package:suri/pages/auth/signup.dart';

final signInOrSignUpProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

class SignInOrSignUp extends ConsumerWidget {
  const SignInOrSignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInOrSignUp = ref.watch(signInOrSignUpProvider);

    if (signInOrSignUp) {
      return Signin();
    } else {
      return Signup();
    }
  }
}
