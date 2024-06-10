import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/about_us_controller.dart';
import 'package:recything_application/screens/about_us/widgets/tim_content_widget.dart';
import 'package:recything_application/screens/about_us/widgets/perusahaan_content_widget.dart';
import 'package:recything_application/widgets/global_app_bar.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
  final AboutUsController aboutUsController = Get.put(AboutUsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: const GlobalAppBar(
        title: Text(
          " About Us",
        ),
        backgroundColor: ColorConstant.whiteColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ContainedTabBarView(
              callOnChangeWhileIndexIsChanging: true,
              initialIndex: aboutUsController.index.value,
              onChange: (index) {
                if (index == 0) {
                  aboutUsController.index.value == index;
                  aboutUsController.param.value == "perusahaan";
                  aboutUsController.getAboutUs("perusahaan");
                } else if (index == 1) {
                  aboutUsController.index.value == index;
                  aboutUsController.param.value == "tim";
                  aboutUsController.getAboutUs("tim");
                } else {
                  aboutUsController.index.value == index;
                  aboutUsController.param.value == "contact_us";
                  aboutUsController.getAboutUs("contact_us");
                }
              },
              tabBarProperties: TabBarProperties(
                background: Container(
                  color: ColorConstant.whiteColor,
                ),
                labelStyle: TextStyleConstant.boldParagraph
                    .copyWith(color: ColorConstant.netralColor900),
                indicatorColor: ColorConstant.primaryColor500,
                unselectedLabelStyle: TextStyleConstant.boldParagraph.copyWith(
                  color: ColorConstant.netralColor600,
                ),
              ),
              tabs: const [
                Text("Perusahaan"),
                Text("Kenali Tim"),
                Text("Contact Us"),
              ],
              views: [
                PerusahaanContent(),
                SingleChildScrollView(
                  child: KenaliTimContent(),
                ),
                ContactUsContent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
                      return PerusahaanContentWidget(
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
                      return PerusahaanContentWidget(
                        title: aboutUsData!.title.toString(),
                        subTitle: aboutUsData.description.toString(),
                      );
                    } else if (aboutUsData!.images!.length >= 1) {
                      return PerusahaanContentWidget(
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

class KenaliTimContent extends StatelessWidget {
  KenaliTimContent({super.key});
  final AboutUsController aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Obx(() {
        if (aboutUsController.isLoading.value) {
          return const Center(
            child: MyLoading(),
          );
        }
        final aboutUsDataList = aboutUsController.aboutUsData.value?.data;
        if (aboutUsDataList == null) {
          return const Text('Data tidak tersedia');
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingConstant.verticalSpacing300,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: aboutUsDataList.length,
                itemBuilder: (context, index) {
                  var aboutUsData = aboutUsDataList[index];
                  var images = aboutUsData.images ?? [];
                  return TimContentWidget(
                    title: aboutUsData.title.toString(),
                    subTitle: aboutUsData.description.toString(),
                    child: SizedBox(
                      height: 98,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: images.map((image) {
                          return Container(
                            width: 98,
                            height: 98,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                image.imageUrl.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

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
                      return PerusahaanContentWidget(
                        title: aboutUsData!.title.toString(),
                        subTitle: aboutUsData.description.toString(),
                      );
                    } else if (aboutUsData!.images!.length >= 1) {
                      return PerusahaanContentWidget(
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
