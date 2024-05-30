import 'package:flutter/material.dart';
import 'package:recything_application/screens/detail_mission/widgets/custom_point_widget.dart';

class MissionHeader extends StatelessWidget {
  final String imageUrl;
  final String pointChallenge;

  const MissionHeader({
    Key? key,
    required this.imageUrl,
    required this.pointChallenge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: CustomPointWidget(
            pointChallenge: pointChallenge,
            width: 80,
            height: 20,
          ),
        )
      ],
    );
  }
}
