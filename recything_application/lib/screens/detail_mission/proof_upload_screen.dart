import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_proof_upload_controller.dart';
import 'package:recything_application/screens/detail_mission/widgets/bukti_satu_widget.dart';

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
  final ImagePicker _picker = ImagePicker();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isTextValid = true;

  Future<void> _pickFiles(int bukti) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.5),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pilih Unggahan',
                    style: TextStyleConstant.boldParagraph
                        .copyWith(color: ColorConstant.netralColor900),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();
                        if (controller.selectedImages.length < 12) {
                          final XFile? photo = await _picker.pickImage(
                              source: ImageSource.camera);
                          if (photo != null) {
                            setState(() {
                              controller.selectedImages.add(photo.path);
                            });
                          }
                        } else {
                          _showMaxPhotosDialog(context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          ImageConstant.camera,
                          width: 92,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();
                        if (controller.selectedImages.length < 12) {
                          final List<XFile>? images =
                              await _picker.pickMultiImage();
                          if (images != null && images.isNotEmpty) {
                            if (controller.selectedImages.length +
                                    images.length <=
                                12) {
                              setState(() {
                                controller.selectedImages.addAll(
                                    images.map((image) => image.path).toList());
                              });
                            } else {
                              _showMaxPhotosDialog(context);
                            }
                          }
                        } else {
                          _showMaxPhotosDialog(context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          ImageConstant.gallery,
                          width: 92,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Batalkan',
                      style: TextStyleConstant.boldParagraph
                          .copyWith(color: ColorConstant.netralColor900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMaxPhotosDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Maximum Photos Reached'),
          content: Text('You can only select up to 12 photos.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
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
                BuktiSatuWidget(
                  selectedBukti: controller.selectedImages,
                  pickFiles: _pickFiles,
                  removeBukti: removeBuktiSatu,
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
}
