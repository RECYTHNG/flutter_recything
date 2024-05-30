import 'package:flutter/material.dart';
import 'package:recything_application/screens/challenge_list/widgets/header_challenge_list_widget.dart';
import 'package:recything_application/screens/challenge_list/widgets/item_challenge_list_widget.dart';
import 'package:recything_application/screens/challenge_list/widgets/subheader_challenge_widget.dart';

class ChallengeListScreen extends StatelessWidget {
  const ChallengeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderChallengeListWidget(),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SubheaderChallengeWidget(),
                  SizedBox(height: 16),
                  ItemChallengeListWidget(points: '20.000', title: 'Melakukan Pembuangan Sampah',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
