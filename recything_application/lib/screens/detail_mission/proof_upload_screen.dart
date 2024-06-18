import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/doing_task_proof_upload_controller.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_start_screen.dart';
import 'package:recything_application/screens/detail_mission/widgets/bukti_satu_widget.dart';

class ProofUploadScreen extends StatefulWidget {
  final String userTaskId;

  const ProofUploadScreen({super.key, required this.userTaskId});

  @override
  State<ProofUploadScreen> createState() => _ProofUploadScreenState();
}

class _ProofUploadScreenState extends State<ProofUploadScreen> {
  final DoingTaskProofUploadController controller =
      Get.put(DoingTaskProofUploadController());
  // List<String> _selectedBukti1 = [];
  final ImagePicker _picker = ImagePicker();
  final TextEditingController descriptionController = TextEditingController();

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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final XFile? photo =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (photo != null) {
                      setState(() {
                        controller.selectedImages.add(photo.path);
                      });
                    }
                  },
                  child: SvgPicture.asset(
                    IconConstant.iconInputUseCamera,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    IconConstant.iconInputUseCamera,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final List<XFile>? images = await _picker.pickMultiImage();
                    if (images != null && images.isNotEmpty) {
                      setState(
                        () {
                          controller.selectedImages.addAll(
                              images.map((image) => image.path).toList());
                        },
                      );
                    }
                  },
                  child: SvgPicture.asset(
                    IconConstant.iconInputUseCamera,
                  ),
                ),
              ],
            ),
          ),
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
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.uploadProof(
                        widget.userTaskId, descriptionController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.primaryColor500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Upload Bukti',
                    style: TextStyleConstant.semiboldSubtitle.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
