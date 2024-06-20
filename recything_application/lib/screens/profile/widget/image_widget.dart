import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/profile_controller.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    if (profileController.isLoading == true) {
      return const MyLoading();
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(47.5),
        child: profileController.userData.value?.pictureUrl == null ||
                profileController.userData.value!.pictureUrl!.isEmpty
            ? Image.asset(
                "assets/images/profile/icon_person.png",
                fit: BoxFit.cover,
                width: 95,
                height: 95,
              )
            : Image.network(
                profileController.userData.value!.pictureUrl!,
                fit: BoxFit.cover,
                width: 95,
                height: 95,
              ),
      );
    }
  }
}
