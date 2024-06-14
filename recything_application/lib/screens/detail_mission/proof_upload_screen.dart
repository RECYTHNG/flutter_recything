import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_screen.dart';
import 'package:recything_application/screens/detail_mission/widgets/bukti_dua_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/bukti_satu_widget.dart';

class ProofUploadScreen extends StatefulWidget {
  const ProofUploadScreen({super.key});

  @override
  State<ProofUploadScreen> createState() => _ProofUploadScreenState();
}

class _ProofUploadScreenState extends State<ProofUploadScreen> {
  List<String> _selectedBukti1 = [];
  List<String> _selectedBukti2 = [];

  Future<void> _pickFiles(int bukti) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(
        () {
          if (bukti == 1) {
            _selectedBukti1.addAll(
              result.paths.map((path) => path!).toList(),
            );
          } else if (bukti == 2) {
            _selectedBukti2.addAll(
              result.paths.map((path) => path!).toList(),
            );
          }
        },
      );
    }
  }

  void removeBuktiSatu(int index) {
    setState(
      () {
        _selectedBukti1.removeAt(index);
      },
    );
  }

  void removeBuktiDua(int index) {
    setState(
      () {
        _selectedBukti2.removeAt(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                selectedBukti: _selectedBukti1,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailMissionScreen(
                          // statusChallenge: 'Menunggu Verifikasi',
                          // proofUpload: true,
                          taskId: 'TM0003',
                        ),
                      ),
                    );
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
