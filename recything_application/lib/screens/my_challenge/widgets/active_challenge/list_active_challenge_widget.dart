import 'package:flutter/material.dart';
import 'package:recything_application/screens/my_challenge/widgets/item_challenge_widget.dart';

class ListActiveChallengeWidget extends StatelessWidget {
  const ListActiveChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ItemChallengeWidget(),
        ],
      ),
    );
  }
}
