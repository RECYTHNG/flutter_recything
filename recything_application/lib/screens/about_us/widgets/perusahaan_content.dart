import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/about_us_controller.dart';
import 'package:recything_application/screens/about_us/widgets/about_us_content_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class PerusahaanContent extends StatelessWidget {
  PerusahaanContent({super.key});
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
                    if (aboutUsData?.title == "Pendidikan Masyarakat") {
                      return AboutUsContentWidget(
                        title: aboutUsData!.title.toString(),
                        subTitle: aboutUsData.description.toString(),
                        height: 160,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: ListView.builder(
                            itemCount: aboutUsData.images?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  right: 13,
                                  top: 2,
                                  bottom: 2,
                                ),
                                height: 160,
                                width: 312,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    aboutUsData.images![index].imageUrl
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else if (aboutUsData?.images!.length == 0) {
                      return AboutUsContentWidget(
                        title: aboutUsData!.title.toString(),
                        subTitle: aboutUsData.description.toString(),
                      );
                    } else if (aboutUsData!.images!.length >= 1) {
                      return AboutUsContentWidget(
                        title: aboutUsData.title.toString(),
                        height: 98,
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