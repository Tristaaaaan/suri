import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:suri/components/textfield/rounded_textfield_title.dart';
import 'package:suri/pages/auth/signin_or_signup.dart';
import 'package:suri/provider/auth/auth_providers.dart';

final lastPageProvider = StateProvider.autoDispose<bool>((ref) => false);

class Signup extends ConsumerWidget {
  Signup({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _createPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final controller = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.watch(requestFirstName);
    final lastName = ref.watch(requestLastName);
    final email = ref.watch(requestEmail);
    final password = ref.watch(requestPassword);
    final confirmPassword = ref.watch(requestConfirmPassword);
    final lastPage = ref.watch(lastPageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create an account"),
        centerTitle: true,
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "What is your name?",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RoundedTextField(
                hinttext: "First Name",
                controller: _firstNameController,
                onChanged: (firstName) {
                  ref.read(requestFirstName.notifier).state = firstName;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              RoundedTextField(
                hinttext: "Last Name",
                controller: _lastNameController,
                onChanged: (lastName) {
                  ref.read(requestLastName.notifier).state = lastName;
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              RoundedTextField(
                hinttext: "Email",
                controller: _emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundedTextField(
                hinttext: "Password",
                controller: _createPasswordController,
                withButton: true,
                eyeKey: 'createpasswordKey',
              ),
              const SizedBox(
                height: 15,
              ),
              RoundedTextField(
                hinttext: "Confirm Password",
                controller: _confirmPasswordController,
                withButton: true,
                eyeKey: 'confirmpasswordKey',
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        child: Stack(
          children: [
            if (lastPage)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    child: const Text("Back"),
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      ref.read(lastPageProvider.notifier).state = false;
                    }),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    onDotClicked: (int index) {
                      controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Theme.of(context).colorScheme.tertiary,
                      activeDotColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14)),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(signInOrSignUpProvider.notifier).state = true;
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: lastPage ? const Text("Sign up") : const Text("Proceed"),
                onPressed: () {
                  if (!lastPage) {
                    if (firstName.isNotEmpty && lastName.isNotEmpty) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      ref.read(lastPageProvider.notifier).state = true;
                    } else {
                      if (email.isNotEmpty &&
                          password.isNotEmpty &&
                          confirmPassword.isNotEmpty) {}
                    }
                  } else {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
