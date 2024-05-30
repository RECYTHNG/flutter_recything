import 'package:flutter/material.dart';
import 'package:recything_application/screens/challenge_list/widgets/item_challenge_list_widget.dart';

class ChallengeListWidget extends StatelessWidget {
  const ChallengeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> challenges = [
      {'points': '50', 'title': 'Recycle 10 plastic bottles'},
      {'points': '100', 'title': 'Plant a tree'},
      {'points': '75', 'title': 'Use a reusable bag for shopping'},
    ];

    return ListView.builder(
      itemCount: challenges.length,
      itemBuilder: (context, index) {
        final challenge = challenges[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ItemChallengeListWidget(
            points: challenge['points']!,
            title: challenge['title']!,
          ),
        );
      },
    );
  }
}
