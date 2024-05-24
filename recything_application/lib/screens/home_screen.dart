import 'package:flutter/material.dart';
import 'package:recything_application/screens/about_us/about_us_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUsScreen(),
                  ));
            },
            child: const Text("Test")),
      ),
    );
  }
}
