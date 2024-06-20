import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';

class UploadImageReportRubbishWidget extends StatelessWidget {
  const UploadImageReportRubbishWidget({super.key});

  Widget _buildImageContainer(XFile? imageFile, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 91,
        height: 91,
        decoration: BoxDecoration(
          color: imageFile != null ? null : const Color(0xFFEDF2F7),
          borderRadius: BorderRadius.circular(8),
          image: imageFile != null
              ? DecorationImage(
                  image: FileImage(
                    File(imageFile.path),
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imageFile == null
            ? const Center(
                child: Icon(Icons.add),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MapRubbishController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Unggah Bukti Foto',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.only(
            bottom: 16,
            left: 8,
            right: 8,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 7),
                blurRadius: 25.2,
                color: const Color(0XFF64646F).withOpacity(0.2),
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () {
                  return GridView.builder(
                    padding: const EdgeInsets.only(top: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: controller.imageFiles.length < 9
                        ? controller.imageFiles.length + 1
                        : 9,
                    itemBuilder: (context, index) {
                      if (index == controller.imageFiles.length &&
                          !controller.isMaxImagesReached()) {
                        return _buildImageContainer(
                          null,
                          () => controller.showImageSourceDialog(controller.pickImage),
                        );
                      } else if (index < controller.imageFiles.length) {
                        return _buildImageContainer(
                          controller.imageFiles[index],
                          () {
                            controller.replaceImage(index);
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
                },
              ),
              SpacingConstant.verticalSpacing200,
              Stack(
                children: [
                  const SizedBox(
                    height: 55,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: double.infinity,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: ColorConstant.primaryColor500,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorConstant.primaryColor500,
                          width: 4,
                          strokeAlign: 0,
                        ),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: ColorConstant.primaryColor500,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}