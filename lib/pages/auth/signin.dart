import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/pages/auth/signin_or_signup.dart';
import 'package:suri/provider/auth/auth_providers.dart';

class Signin extends ConsumerWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(googleSignInLoading);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  ref.read(signInOrSignUpProvider.notifier).state = false;
                },
                child: const Text("SignUp"),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: isLoading
                        ? null
                        : () async {
                            final signin =
                                ref.read(googleSignInLoading.notifier);
                            signin.update((state) => true);

                            await ref
                                .read(authServicesProvider)
                                .signInWithGoogle(ref, context);

                            signin.update(
                              (state) => false,
                            );
                          },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/google-color_svgrepo.com.svg',
                          height: 20,
                          width: 20,
                        ),
                        Expanded(
                          child: isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : const Text(
                                  "Google",
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
