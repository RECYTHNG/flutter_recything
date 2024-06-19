import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/profile_controller.dart';
import 'package:recything_application/screens/profile/widget/image_widget.dart';
import 'package:recything_application/widgets/global_image_picker_dialog_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Row(
          children: [
            SizedBox(
              height: 95,
              width: 95,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ImageWidget(),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return GlobalImagePickerDialogWidget(
                              onImageSourceSelected: (source) {
                                profileController.uploadAndgetImage(source);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          color: ColorConstant.netralColor500,
                          shape: BoxShape.circle,
                        ),
                        child:
                            Image.asset("assets/images/profile/icon_edit.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SpacingConstant.horizontalSpacing400,
            profileController.isLoading.value == true
                ? const MyLoading()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${profileController.userData.value?.name}",
                        style: TextStyleConstant.semiboldParagraph.copyWith(
                          color: ColorConstant.netralColor900,
                        ),
                      ),
                      SpacingConstant.verticalSpacing100,
                      Text(
                        "${profileController.userData.value?.email}",
                        style: TextStyleConstant.regularParagraph.copyWith(
                          color: ColorConstant.netralColor600,
                        ),
                      ),
                      SpacingConstant.verticalSpacing100,
                      Text(
                        "Lengkapi Profil",
                        style: TextStyleConstant.boldCaption.copyWith(
                          color: ColorConstant.infoColor500,
                        ),
                      )
                    ],
                  ),
          ],
        );
      },
    );
  }
}
