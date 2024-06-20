import 'package:flutter/material.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_progress_screen.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_start_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMissionStartScreen(
                      taskId: 'TM0011',
                    ),
                  ),
                );
              },
              child: const Text("Start Task"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMissionProgressScreen(
                      userTaskId: 'UT0033',
                    ),
                  ),
                );
              },
              child: const Text("Continue Task"),
            ),
          ],
        ),
      ),
    );
  }
}
