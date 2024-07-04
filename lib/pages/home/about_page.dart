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
            "Welcome to SURI, the cutting-edge mobile application developed as part of our thesis project titled \"Design and Development of a Coffee Borer Beetle Detection System.\" Our mission is to revolutionize the way coffee farmers detect and combat the Coffee Berry Borer (CBB) infestation.\n\n"
            "At SURI, we understand the critical importance of early detection in safeguarding coffee plantations. The Coffee Berry Borer poses a significant threat, causing extensive damage to coffee crops worldwide. With our innovative application, farmers can now detect signs of CBB infestation early on, enabling prompt and effective intervention to mitigate its spread.",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
