import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class EditPhotoBottomSheet extends StatelessWidget {
  final XFile media;
  final int index;
  final VoidCallback onReplaceImage;
  final VoidCallback onDelete;

  const EditPhotoBottomSheet({
    super.key,
    required this.media,
    required this.index,
    required this.onReplaceImage,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 108,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorConstant.netralColor600,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Preview Media',
            style: TextStyleConstant.semiboldHeading4,
          ),
          SizedBox(height: 24),
          Image.file(
            File(media.path),
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: onReplaceImage,
                child: Column(
                  children: [
                    Icon(
                      Icons.edit,
                      color: ColorConstant.primaryColor500,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ganti Foto',
                      style: TextStyleConstant.regularSubtitle,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onDelete,
                child: Column(
                  children: [
                    Icon(
                      Icons.delete,
                      color: ColorConstant.primaryColor500,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hapus',
                      style: TextStyleConstant.regularSubtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
