import 'package:flutter/material.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ContentSectionWidget extends StatelessWidget {
  final String title;
  final String? imagePath;
  final String contentTexts;

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
          style: TextStyleConstant.boldSubtitle,
        ),
        if (imagePath != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Image.network(
              imagePath!,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: MyLoading(),
                  ),
                );
              },
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
        Text(
          contentTexts,
          style: TextStyleConstant.regularParagraph,
          textAlign: TextAlign.justify,
        ),
        SpacingConstant.verticalSpacing200,
      ],
    );
  }
}
