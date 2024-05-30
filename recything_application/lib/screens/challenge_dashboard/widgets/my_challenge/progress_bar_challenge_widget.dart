import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';

class ProgressBarChallengeWidget extends StatelessWidget {
  final int progress;
  const ProgressBarChallengeWidget({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int x = 0; x < 6; x++) ...[
            Container(
              width: 45,
              height: 4,
              decoration: BoxDecoration(
                color: x <= progress
                    ? ColorConstant.primaryColor500
                    : const Color(0xFFD9D9D9),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
            ),
            if (x >= 0 && x != 5) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}