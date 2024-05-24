import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({super.key, required this.assetName});
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      width: 98,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(
            assetName,
          ),
        ),
      ),
    );
  }
}
