import 'package:flutter/material.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ContentSectionWidget extends StatelessWidget {
  final String title;
  final String? imagePath;
  final List<String> contentTexts;

  const ContentSectionWidget({
    super.key,
    required this.title,
    this.imagePath,
    required this.contentTexts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyleConstant.boldHeading3,
        ),
        if (imagePath != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Image.asset(
              imagePath!,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                );
              },
            ),
          ),
        ...contentTexts.map((text) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                text,
                style: TextStyleConstant.mediumSubtitle,
              ),
            )),
        SpacingConstant.verticalSpacing200,
      ],
    );
  }
}
