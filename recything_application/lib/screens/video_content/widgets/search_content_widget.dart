import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/screens/video_content/detail_video_content_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';


class SearchContentWidget extends StatelessWidget {
  SearchContentWidget({super.key});
  final VideoContentController videoContentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacingConstant.horizontalSpacing300,
        Expanded(
          child: Obx(
            () {
              if (videoContentController.isLoading.value) {
                return const Center(
                  child: MyLoading(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 16, top: 7),
                      child: Divider(
                        color: ColorConstant.netralColor500,
                      ),
                    ),
                    itemCount: videoContentController
                            .searchVideoContentData.value?.data?.length ??
                        0,
                    itemBuilder: (context, index) {
                      var videoData = videoContentController
                          .searchVideoContentData.value?.data?[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                              DetailVideoContentScreen(id: videoData?.id ?? 0));
                          videoContentController
                              .getDetailVideoContent(videoData?.id ?? 0);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 155.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: videoData?.urlThumbnail == ""
                                    ? Image.asset(
                                        "assets/images/video_content/placeholder_video_content.png",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        "${videoData?.urlThumbnail}",
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SpacingConstant.verticalSpacing150,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  videoData?.title ?? "Unknown title",
                                  style:
                                      TextStyleConstant.boldParagraph.copyWith(
                                    color: ColorConstant.netralColor900,
                                  ),
                                ),
                                SpacingConstant.verticalSpacing100,
                                Text(
                                  "${videoContentController.formatNumber(videoData?.viewer ?? 0)} ditonton",
                                  style:
                                      TextStyleConstant.regularFooter.copyWith(
                                    color: ColorConstant.netralColor900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}