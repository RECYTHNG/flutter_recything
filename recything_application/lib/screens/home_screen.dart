import 'package:flutter/material.dart';
import 'package:recything_application/screens/leaderboard/leaderboard_screen.dart';

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
                    builder: (context) => LeaderboardScreen(),
                  ));
            },
            child: const Text("Test")),
      ),
    );
  }
}
