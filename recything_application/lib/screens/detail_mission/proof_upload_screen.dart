import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_proof_upload_controller.dart';
import 'package:recything_application/widgets/global_image_picker_dialog_widget.dart';

class ProofUploadScreen extends StatefulWidget {
  final String userTaskId;
  final String statusAccept;

  const ProofUploadScreen(
      {super.key, required this.userTaskId, required this.statusAccept});

  @override
  State<ProofUploadScreen> createState() => _ProofUploadScreenState();
}

class _ProofUploadScreenState extends State<ProofUploadScreen> {
  final DoingTaskProofUploadController controller =
      Get.put(DoingTaskProofUploadController());
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isTextValid = true;

  Future<void> _pickFiles() async {
    showDialog(
      context: context,
      builder: (context) {
        return GlobalImagePickerDialogWidget(
          onImageSourceSelected: (ImageSource source) {
            controller.pickImage(source);
          },
        );
      },
    );
  }

  void removeBuktiSatu(int index) {
    setState(
      () {
        controller.selectedImages.removeAt(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.userTaskId);
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Upload Bukti',
          style: TextStyleConstant.semiboldTitle.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConstant.primaryColor500,
        foregroundColor: ColorConstant.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    'Upload Aksimu',
                    style: TextStyleConstant.semiboldHeading4,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Yuk Upload foto saat kamu melakukan Aksimu',
                    style: TextStyleConstant.regularParagraph,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Bukti Pengerjaan Challenge',
                  style: TextStyleConstant.semiboldParagraph,
                ),
                const SizedBox(height: 8),
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
                      itemCount: controller.selectedImages.length < 9
                          ? controller.selectedImages.length + 1
                          : 9,
                      itemBuilder: (context, index) {
                        if (index == controller.selectedImages.length &&
                            !controller.isMaxImagesReached()) {
                          return _buildImageContainer(
                            null,
                            _pickFiles,
                          );
                        } else if (index < controller.selectedImages.length) {
                          return _buildImageContainer(
                            controller.selectedImages[index],
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
                const SizedBox(height: 8),
                Text(
                  'max: 12 foto',
                  style: TextStyleConstant.regularParagraph.copyWith(
                    color: ColorConstant.netralColor600,
                  ),
                ),
                const SizedBox(height: 64),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Keterangan',
                    style: TextStyleConstant.semiboldSubtitle,
                  ),
                ),
                TextFormField(
                  controller: descriptionController,
                  minLines: 5,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: const OutlineInputBorder(),
                    hintText: 'Tulis keterangan aksimu disini...',
                    hintStyle: TextStyleConstant.regularParagraph,
                    errorText:
                        isTextValid ? null : 'Keterangan tidak boleh kosong',
                  ),
                  onChanged: (value) {
                    setState(() {
                      isTextValid = value.isNotEmpty;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Obx(
                  () {
                    return Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.selectedImages.isNotEmpty &&
                                  descriptionController.text.isNotEmpty) {
                                controller.uploadProof(
                                    widget.userTaskId,
                                    descriptionController.text,
                                    widget.statusAccept);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  controller.selectedImages.isNotEmpty &&
                                          descriptionController.text.isNotEmpty
                                      ? ColorConstant.primaryColor500
                                      : ColorConstant.netralColor700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Upload Bukti',
                              style:
                                  TextStyleConstant.semiboldSubtitle.copyWith(
                                color: ColorConstant.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        if (controller.isLoading.value)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer(String? imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: imagePath != null
              ? DecorationImage(
                  image: FileImage(File(imagePath)),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imagePath == null
            ? SvgPicture.asset(IconConstant.uploadButtonAfter)
            : null,
      ),
    );
  }
}
