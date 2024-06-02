import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/detail_mission/proof_upload_screen.dart';
import 'package:recything_application/screens/detail_mission/widgets/mission_header_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/mission_step_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/status_detail_mission_widget.dart';
import 'package:recything_application/screens/detail_mission/widgets/button_challenge_widget.dart';

// ignore: must_be_immutable
class DetailMissionScreen extends StatefulWidget {
  String statusChallenge;
  final bool proofUpload;

  DetailMissionScreen({
    super.key,
    required this.statusChallenge,
    required this.proofUpload,
  });

  @override
  State<DetailMissionScreen> createState() => _DetailMissionScreenState();
}

class _DetailMissionScreenState extends State<DetailMissionScreen> {
  final String pointChallenge = '3000';
  final List<Map<String, String>> missionSteps = [
    {
      'title': "Kumpulkan Bahan",
      'description':
          "Cari bahan daur ulang yang akan kamu gunakan, seperti botol plastik, kertas bekas, atau kardus.",
      'progress': 'pending'
    },
    {
      'title': "Foto Bahan",
      'description': "Foto bahan yang akan kamu gunakan",
      'progress': 'pending'
    },
    {
      'title': "Buat Karya",
      'description':
          "Gunakan kreativitasmu untuk membuat karya dari bahan daur ulang yang telah dikumpulkan.",
      'progress': 'pending'
    },
    {
      'title': "Ambil Foto",
      'description':
          "Setelah selesai, ambil foto hasil karya daur ulang yang telah kamu buat.",
      'progress': 'pending'
    },
    {
      'title': "Unggah Foto",
      'description': "Unggah foto hasil karyamu di aplikasi recycling",
      'progress': 'pending'
    },
    {
      'title': "Tunggu Verifikasi",
      'description':
          "Klik selesai, lalu tunggu verifikasi untuk mendapatkan poin",
      'progress': 'pending'
    },
  ];

  bool challengeStarted = false;
  int currentStep = 0;
  bool isUploadButton = false;

  @override
  void initState() {
    super.initState();
    if (widget.proofUpload) {
      for (var step in missionSteps) {
        step['progress'] = 'done';
      }
    }
  }

  void _advanceStep() {
    setState(() {
      if (widget.statusChallenge == "Ditolak") {
        for (var step in missionSteps) {
          step['progress'] = 'done';
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProofUploadScreen()),
        );
      } else if (widget.proofUpload) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else {
        if (!challengeStarted) {
          challengeStarted = true;
          widget.statusChallenge = "Proses";
        } else if (currentStep < missionSteps.length - 1) {
          missionSteps[currentStep]['progress'] = 'done';
          currentStep++;
        } else if (currentStep == missionSteps.length - 1 && !isUploadButton) {
          missionSteps[currentStep]['progress'] = 'done';
          isUploadButton = true;
        } else if (currentStep == missionSteps.length - 1 && isUploadButton) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProofUploadScreen()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Challenge',
          style: TextStyleConstant.semiboldTitle.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConstant.primaryColor500,
        foregroundColor: ColorConstant.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MissionHeader(
                imageUrl: ImageConstant.imageChallenge,
                pointChallenge: pointChallenge,
              ),
              const SizedBox(height: 12),
              StatusDetailMissionWidget(
                status: widget.statusChallenge,
              ),
              const SizedBox(height: 16),
              Text(
                'Daur Ulang Kreatif',
                style: TextStyleConstant.semiboldHeading4,
              ),
              const SizedBox(height: 8),
              Text(
                'Buatlah karya seni atau barang fungsional dari bahan daur ulang yang kamu miliki, lalu unggah foto hasilnya untuk menyelesaikan tantangan ini.',
                style: TextStyleConstant.regularParagraph,
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: missionSteps.length,
                itemBuilder: (context, index) {
                  final step = missionSteps[index];
                  return MissionStepWidget(
                    index: index,
                    title: step['title']!,
                    description: step['description']!,
                    progress: step['progress']!,
                  );
                },
              ),
              const SizedBox(height: 12),
              ButtonChallengeWidget(
                challengeStarted: challengeStarted,
                currentStep: currentStep,
                isUploadButton: isUploadButton,
                proofUpload: widget.proofUpload,
                statusChallenge: widget.statusChallenge,
                onPressed: _advanceStep,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
