import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class GlobalImagePickerDialogWidget extends StatelessWidget {
  final Function(ImageSource) onImageSourceSelected;
  const GlobalImagePickerDialogWidget({
    super.key,
    required this.onImageSourceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstant.whiteColor,
      contentPadding: const EdgeInsets.all(16),
      title: Text(
        'Pilih Unggahan',
        style: TextStyleConstant.boldParagraph.copyWith(
          color: ColorConstant.netralColor900,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpacingConstant.verticalSpacing100,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  onImageSourceSelected(ImageSource.camera);
                  Get.back();
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        ImageConstant.camera,
                        height: 50,
                      ),
                      SpacingConstant.verticalSpacing100,
                      Text(
                        'Camera',
                        style: TextStyleConstant.boldFooter.copyWith(
                          color: ColorConstant.netralColor900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  onImageSourceSelected(ImageSource.gallery);
                  Get.back();
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        ImageConstant.gallery,
                        height: 50,
                      ),
                      SpacingConstant.verticalSpacing100,
                      Text(
                        'Gallery',
                        style: TextStyleConstant.boldFooter.copyWith(
                          color: ColorConstant.netralColor900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SpacingConstant.verticalSpacing100,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                    ColorConstant.primaryColor200,
                  ),
                ),
                child: Text(
                  'Kembali',
                  style: TextStyleConstant.boldParagraph.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
