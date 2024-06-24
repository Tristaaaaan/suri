import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:suri/components/button/regular_button.dart';
import 'package:suri/components/textfield/rounded_textfield_title.dart';
import 'package:suri/pages/auth/signin_or_signup.dart';

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
              ),
              const SizedBox(
                height: 15,
              ),
              RoundedTextField(
                hinttext: "Last Name",
                controller: _lastNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              RegularButton(
                text: "Proceed",
                withIcon: false,
                backgroundColor: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.background,
                buttonKey: "proceed",
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
              const SizedBox(
                height: 15,
              ),
              RegularButton(
                text: "Sign up",
                withIcon: false,
                backgroundColor: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.background,
                buttonKey: "signUp",
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Stack(
        children: [
          SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
          ),
        ],
      ),
    );
  }
}
