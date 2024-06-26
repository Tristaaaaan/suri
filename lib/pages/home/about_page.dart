import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About us"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "This application is Develop for our thesis titled “DESIGN AND DEVELOPMENT OF A COFFEE BORER BEETLE DETECTION SYSTEM”, an early detection of CBB infestation can help prevent further damage to coffee plantations.",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
