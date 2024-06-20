import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/screens/video_content/widgets/komentar_widget.dart';
import 'package:recything_application/services/video_content/video_content_service.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/widgets/global_search_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideoContentScreen extends StatelessWidget {
  DetailVideoContentScreen({super.key, required this.id});

  final int id;

  final VideoContentController videoContentController =
      Get.put(VideoContentController());

  VideoContentService videoContentService = VideoContentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Obx(
          () {
            var detailVideoData =
                videoContentController.detailVideoContentData.value?.data;
            return videoContentController.isLoading.value
                ? const Center(
                    child: MyLoading(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller:
                                videoContentController.youtubePlayerController!,
                            showVideoProgressIndicator: true,
                            onReady: () {
                              videoContentController.youtubePlayerController!
                                  .addListener(() {
                                if (videoContentController
                                    .youtubePlayerController!
                                    .value
                                    .isFullScreen) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.immersiveSticky);
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.landscapeLeft,
                                    DeviceOrientation.landscapeRight,
                                  ]);
                                } else {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.edgeToEdge);
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.portraitUp,
                                    DeviceOrientation.portraitDown,
                                  ]);
                                }
                              });
                            },
                            onEnded: (metaData) {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.edgeToEdge);
                            },
                          ),
                          builder: (context, player) {
                            return Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: player,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${detailVideoData!.dataVideo?.title}",
                                                style: TextStyleConstant
                                                    .boldTitle
                                                    .copyWith(
                                                  color: ColorConstant
                                                      .netralColor900,
                                                ),
                                              ),
                                              SpacingConstant
                                                  .verticalSpacing150,
                                              const Divider(
                                                color: ColorConstant
                                                    .netralColor500,
                                              ),
                                              SpacingConstant
                                                  .verticalSpacing150,
                                              Text(
                                                "Deskripsi",
                                                style: TextStyleConstant
                                                    .boldSubtitle
                                                    .copyWith(
                                                  color: ColorConstant
                                                      .netralColor900,
                                                ),
                                              ),
                                              SpacingConstant
                                                  .verticalSpacing100,
                                              Text(
                                                "${detailVideoData.dataVideo?.description}",
                                                style: TextStyleConstant
                                                    .regularParagraph
                                                    .copyWith(
                                                  color: ColorConstant
                                                      .netralColor900,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SpacingConstant
                                                  .verticalSpacing150,
                                              const Divider(
                                                color: ColorConstant
                                                    .netralColor500,
                                              ),
                                              SpacingConstant
                                                  .verticalSpacing075,
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  left: 10,
                                                ),
                                                height: 44,
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Komentar",
                                                      style: TextStyleConstant
                                                          .boldSubtitle
                                                          .copyWith(
                                                        color: ColorConstant
                                                            .netralColor900,
                                                      ),
                                                    ),
                                                    SpacingConstant
                                                        .horizontalSpacing150,
                                                    detailVideoData.comments !=
                                                            null
                                                        ? Text(
                                                            "${detailVideoData.comments.length}",
                                                            style: TextStyleConstant
                                                                .semiboldCaption
                                                                .copyWith(
                                                              color: ColorConstant
                                                                  .netralColor900,
                                                            ),
                                                          )
                                                        : Text(
                                                            "0",
                                                            style: TextStyleConstant
                                                                .semiboldCaption
                                                                .copyWith(
                                                              color: ColorConstant
                                                                  .netralColor900,
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                              ),
                                              SpacingConstant
                                                  .verticalSpacing100,
                                              detailVideoData.comments != null
                                                  ? ListView.separated(
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var commentsData =
                                                            detailVideoData
                                                                    .comments[
                                                                index];
                                                        return KomentarWidget(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          width: 35,
                                                          height: 35,
                                                          name: commentsData[
                                                              "user_name"],
                                                          kometar: commentsData[
                                                              "comment"],
                                                          image: NetworkImage(
                                                            commentsData[
                                                                "user_profile"],
                                                          ),
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (context, index) {
                                                        return SpacingConstant
                                                            .verticalSpacing300;
                                                      },
                                                      itemCount: 4,
                                                    )
                                                  : Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 20,
                                                      width: double.infinity,
                                                      child: Text(
                                                        "Belum ada komentar",
                                                        style: TextStyleConstant
                                                            .semiboldCaption
                                                            .copyWith(
                                                          color: ColorConstant
                                                              .netralColor600,
                                                        ),
                                                      ),
                                                    ),
                                              SpacingConstant
                                                  .verticalSpacing200,
                                              GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet<void>(
                                                    isScrollControlled: true,
                                                    useSafeArea: true,
                                                    backgroundColor:
                                                        ColorConstant
                                                            .whiteColor,
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 16,
                                                          bottom: MediaQuery.of(
                                                                  context)
                                                              .viewInsets
                                                              .bottom,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            8),
                                                                child:
                                                                    Container(
                                                                  height: 4,
                                                                  width: 64,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ColorConstant
                                                                        .netralColor600,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Komentar",
                                                              style: TextStyleConstant
                                                                  .boldHeading4
                                                                  .copyWith(
                                                                color: ColorConstant
                                                                    .netralColor900,
                                                              ),
                                                            ),
                                                            SpacingConstant
                                                                .verticalSpacing200,
                                                            Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    videoContentController
                                                                            .sortComment
                                                                            .value =
                                                                        !videoContentController
                                                                            .sortComment
                                                                            .value;
                                                                    videoContentController
                                                                        .getDetailVideoContent(
                                                                            id);
                                                                    Get.back();
                                                                  },
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/video_content/arrow_upward.png",
                                                                    height: 24,
                                                                  ),
                                                                ),
                                                                SpacingConstant
                                                                    .horizontalSpacing150,
                                                                Text(
                                                                  "Urut Komentar Terbaru",
                                                                  style: TextStyleConstant
                                                                      .regularCaption
                                                                      .copyWith(
                                                                    color: ColorConstant
                                                                        .netralColor900,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SpacingConstant
                                                                .verticalSpacing200,
                                                            detailVideoData
                                                                        .comments !=
                                                                    null
                                                                ? Flexible(
                                                                    child: ListView
                                                                        .builder(
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemCount: detailVideoData
                                                                          .comments
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        var commentVideo =
                                                                            detailVideoData.comments[index];
                                                                        return Padding(
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 16.5),
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                const EdgeInsets.only(bottom: 20),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Container(
                                                                                  height: 45,
                                                                                  width: 45,
                                                                                  decoration: BoxDecoration(
                                                                                    image: DecorationImage(
                                                                                      image: NetworkImage(commentVideo["user_profile"]),
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
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Text(
                                                                                              commentVideo["user_name"],
                                                                                              style: TextStyleConstant.semiboldCaption.copyWith(
                                                                                                color: ColorConstant.netralColor900,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              commentVideo["created_at"],
                                                                                              style: TextStyleConstant.regularFooter.copyWith(
                                                                                                color: ColorConstant.netralColor600,
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
                                                                                          style: TextStyleConstant.regularCaption.copyWith(
                                                                                            color: ColorConstant.netralColor900,
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
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter,
                                                                    width: double
                                                                        .infinity,
                                                                    child: Text(
                                                                      "Belum ada komentar",
                                                                      style: TextStyleConstant
                                                                          .semiboldCaption
                                                                          .copyWith(
                                                                        color: ColorConstant
                                                                            .netralColor600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          35),
                                                              child:
                                                                  GlobalSearchBar(
                                                                controller:
                                                                    videoContentController
                                                                        .commentController,
                                                                prefixIcon:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              2,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5),
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 24,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .amber,
                                                                  ),
                                                                ),
                                                                suffixIcon:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    if (videoContentController
                                                                        .commentController
                                                                        .text
                                                                        .isNotEmpty) {
                                                                      videoContentController
                                                                          .postComment(
                                                                        detailVideoData
                                                                            .dataVideo!
                                                                            .id!,
                                                                        videoContentController
                                                                            .commentController
                                                                            .text,
                                                                      );
                                                                      videoContentController
                                                                          .commentController
                                                                          .clear();
                                                                      Navigator.pop(
                                                                          context);
                                                                    } else {
                                                                      Get.snackbar(
                                                                          "Error",
                                                                          "Comment cannot be empty");
                                                                    }
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.send,
                                                                    size: 16,
                                                                    color: ColorConstant
                                                                        .netralColor600,
                                                                  ),
                                                                ),
                                                                height: 40,
                                                                width: double
                                                                    .infinity,
                                                                hintText:
                                                                    "Tuliskan sesuatu ..",
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
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: detailVideoData
                                                              .comments !=
                                                          null
                                                      ? Text(
                                                          "Lihat Semua Komentar",
                                                          style: TextStyleConstant
                                                              .semiboldParagraph
                                                              .copyWith(
                                                            color: ColorConstant
                                                                .infoColor500,
                                                          ),
                                                        )
                                                      : Text(
                                                          "Tambahkan Komentar",
                                                          style: TextStyleConstant
                                                              .semiboldParagraph
                                                              .copyWith(
                                                            color: ColorConstant
                                                                .infoColor500,
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
