import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/challenge_dashboard_controller.dart';
import 'package:recything_application/controllers/profile_controller.dart';
import 'package:recything_application/screens/edit_profile/edit_profile_screen.dart';

class ProfileHeaderChallengeDashboardWidget extends StatelessWidget {
  const ProfileHeaderChallengeDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChallengeDashboardController controller = Get.find();
    final ProfileController profileController = Get.put(ProfileController());
    return Obx(
      () {
        return Positioned(
          top: 55,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Get.to(() => const EditProfileScreen());
            },
            child: Row(
              children: [
                if (profileController.userData.value == null)
                  const Icon(
                    Icons.person,
                    color: ColorConstant.netralColor700,
                    size: 32,
                  )
                else
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        profileController.userData.value!.pictureUrl!,
                        height: 32,
                        width: 32,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.person,
                              color: ColorConstant.netralColor700,
                              size: 32,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                SpacingConstant.horizontalSpacing100,
                if (controller.userAchievementData.value != null)
                  Text(
                    'Hi, ${controller.getFirstName()}',
                    style: TextStyleConstant.semiboldSubtitle.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  )
                else
                  Text(
                    'Hi, User',
                    style: TextStyleConstant.semiboldSubtitle.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                SpacingConstant.horizontalSpacing100,
                SvgPicture.asset(IconConstant.arrowChallenge),
              ],
            ),
          ),
        );
      },
    );
  }
}
