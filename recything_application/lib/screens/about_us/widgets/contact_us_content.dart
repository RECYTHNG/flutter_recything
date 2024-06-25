import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/about_us_controller.dart';
import 'package:recything_application/screens/about_us/widgets/about_us_content_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ContactUsContent extends StatelessWidget {
  ContactUsContent({super.key});
  final AboutUsController aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (aboutUsController.isLoading.value) {
          return const Center(
            child: SizedBox.expand(
              child: Center(
                child: MyLoading(),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SpacingConstant.verticalSpacing250,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: aboutUsController.aboutUsData.value?.data?.length,
                  itemBuilder: (context, index) {
                    var aboutUsData =
                        aboutUsController.aboutUsData.value!.data?[index];
                    if (aboutUsData?.images!.length == 0) {
                      return AboutUsContentWidget(
                        title: aboutUsData!.title.toString(),
                        subTitle: aboutUsData.description.toString(),
                      );
                    } else if (aboutUsData!.images!.length >= 1) {
                      return AboutUsContentWidget(
                        title: aboutUsData.title.toString(),
                        height: 214,
                        width: double.infinity,
                        subTitle: aboutUsData.description.toString(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Image.network(
                            aboutUsData.images!.first.imageUrl.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
