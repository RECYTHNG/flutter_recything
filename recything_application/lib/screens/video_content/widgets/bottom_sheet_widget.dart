import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/profile_controller.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/widgets/global_search_bar.dart';
import 'package:timeago/timeago.dart' as timeago;

class BottomSheetWidget extends StatelessWidget {
  final int id;
  BottomSheetWidget({super.key, required this.id});
  final VideoContentController videoContentController =
      Get.put(VideoContentController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var detailVideoData =
        videoContentController.detailVideoContentData.value?.data;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: ColorConstant.whiteColor,
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 4,
                        width: 64,
                        decoration: BoxDecoration(
                          color: ColorConstant.netralColor600,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Komentar",
                    style: TextStyleConstant.boldHeading4.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                  SpacingConstant.verticalSpacing200,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          videoContentController.sortComment.value =
                              !videoContentController.sortComment.value;
                          videoContentController.getDetailVideoContent(id);
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/images/video_content/arrow_upward.png",
                          height: 24,
                        ),
                      ),
                      SpacingConstant.horizontalSpacing150,
                      Text(
                        "Urut Komentar Terbaru",
                        style: TextStyleConstant.regularCaption.copyWith(
                          color: ColorConstant.netralColor900,
                        ),
                      ),
                    ],
                  ),
                  SpacingConstant.verticalSpacing200,
                  detailVideoData?.comments != null
                      ? Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: detailVideoData?.comments.length,
                            itemBuilder: (context, index) {
                              var commentVideo =
                                  detailVideoData?.comments[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.5),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              commentVideo["user_profile"],
                                            ),
                                          ),
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SpacingConstant.horizontalSpacing200,
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: 17,
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  commentVideo["user_name"] ==
                                                          ""
                                                      ? Text(
                                                          "No name",
                                                          style: TextStyleConstant
                                                              .semiboldCaption
                                                              .copyWith(
                                                            color: ColorConstant
                                                                .netralColor900,
                                                          ),
                                                        )
                                                      : Text(
                                                          commentVideo[
                                                              "user_name"],
                                                          style: TextStyleConstant
                                                              .semiboldCaption
                                                              .copyWith(
                                                            color: ColorConstant
                                                                .netralColor900,
                                                          ),
                                                        ),
                                                  Text(
                                                    timeago.format(
                                                      DateTime.parse(
                                                        commentVideo[
                                                            "created_at"],
                                                      ),
                                                    ),
                                                    style: TextStyleConstant
                                                        .regularFooter
                                                        .copyWith(
                                                      color: ColorConstant
                                                          .netralColor600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SpacingConstant.verticalSpacing100,
                                            Container(
                                              width: double.infinity,
                                              child: Text(
                                                commentVideo["comment"],
                                                style: TextStyleConstant
                                                    .regularCaption
                                                    .copyWith(
                                                  color: ColorConstant
                                                      .netralColor900,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(
                          height: 40,
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                          child: Text(
                            "Belum ada komentar",
                            style: TextStyleConstant.semiboldCaption.copyWith(
                              color: ColorConstant.netralColor600,
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: GlobalSearchBar(
                      controller: videoContentController.commentController,
                      prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 5, bottom: 5, right: 8),
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "${profileController.userData.value?.pictureUrl}"),
                              ),
                            ),
                          )),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (videoContentController
                              .commentController.text.isNotEmpty) {
                            videoContentController.postComment(
                              detailVideoData?.dataVideo!.id! ?? 0,
                              videoContentController.commentController.text,
                            );
                            videoContentController.commentController.clear();
                            Get.back();
                          } else {
                            Get.snackbar("Error", "Comment cannot be empty");
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          size: 16,
                          color: ColorConstant.netralColor600,
                        ),
                      ),
                      height: 40,
                      width: double.infinity,
                      hintText: "Tuliskan sesuatu ..",
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: 19,
        alignment: Alignment.topCenter,
        child: detailVideoData?.comments != null
            ? Text(
                "Lihat Semua Komentar",
                style: TextStyleConstant.semiboldParagraph.copyWith(
                  color: ColorConstant.infoColor500,
                ),
              )
            : Text(
                "Tambahkan Komentar",
                style: TextStyleConstant.semiboldParagraph.copyWith(
                  color: ColorConstant.infoColor500,
                ),
              ),
      ),
    );
  }
}
