import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String name = 'about_screen';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Screen'),
      ),
      body: Placeholder(),
    );
  }
}
