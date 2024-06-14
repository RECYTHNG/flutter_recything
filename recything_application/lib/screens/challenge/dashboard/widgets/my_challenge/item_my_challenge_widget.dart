import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/screens/challenge/widgets/item_user_challenge_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ItemMyChallengeWidget extends StatelessWidget {
  const ItemMyChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    return Obx(
      () {
        if (!controller.isLoadingFetchOnProgressChallenge.value) {
          final data = controller.onProgressChallengeData.value!.data[0];
          return ItemUserChallengeWidget(
            title: data.taskChallenge.title,
            status: data.statusProgress == 'in_progress'
                ? 'Proses'
                : 'Terverifikasi',
            totalStep: data.taskChallenge.taskSteps.length,
            image: 'https://s3-alpha-sig.figma.com/img/65f8/8658/19f102ef2baaa4b0ccde60dd99e7f5ed?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jQSpQKYZqBLoq0-Nih9g0ZXiknbYrbzNQEMoVLjsCy4haA9FxKulODUc9xeSl7KjPF3Z4~90HlDcCDmWDreuCE5riZ8gh-qikeSVlu3hprxf0ncJgjJVP6-NgTGr5wMIq-2jCoyi0dlUWbCmGHgon4BlngTjCasAdLrFythvnexMVRWKYRhScbeyYdbxttcJ-y9VHXcJZNTE1s7AM4FzunfITmmTjwJa~Rqc6XR4TX9~39oiclrJ3TcnvbZKdIi1QGTJxifAWGpOP7wnFV~XP2Dm-MevqBJAWjO8nQPkN4UHisKiyIVxgdfWrJk04Re-PFm9DLlK7W94oOAPrN-akw__',
          );
        } else {
          return const SizedBox(
            height: 140,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyLoading(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
