import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/components/button/regular_button.dart';
import 'package:suri/components/textfield/rounded_textfield_title.dart';
import 'package:suri/pages/auth/signin_or_signup.dart';

class Signin extends ConsumerWidget {
  Signin({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                RoundedTextField(
                  hinttext: "Email",
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundedTextField(
                  hinttext: "Password",
                  controller: _passwordController,
                  withButton: true,
                  eyeKey: 'passwordKey',
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RegularButton(
                  text: "Signin",
                  withIcon: false,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.background,
                  buttonKey: "signin",
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Divider(
                            color: Theme.of(context).colorScheme.secondary,
                            thickness: 1,
                          ),
                        ),
                      ),
                      Text(
                        "or continue with",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Divider(
                            color: Theme.of(context).colorScheme.secondary,
                            thickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RegularButton(
                  text: "Google",
                  backgroundColor: Theme.of(context).colorScheme.background,
                  textColor: Theme.of(context).colorScheme.primary,
                  buttonKey: "signinwithgoogle",
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14)),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(signInOrSignUpProvider.notifier).state = false;
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
