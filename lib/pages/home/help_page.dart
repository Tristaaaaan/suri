import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Join Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "We invite you to join us on this journey towards a more sustainable coffee industry. Together, we can protect coffee crops, preserve livelihoods, and ensure a brighter future for generations to come.",
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Have questions or feedback? Reach out to us at [HERE].\n\nThank you for choosing SURI - your partner in safeguarding coffee plantations against the Coffee Berry Borer.",
            ),
          ],
        ),
      ),
    );
  }
}
