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
  DetailVideoContentScreen({super.key});

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
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: videoContentController
                                      .youtubePlayerController !=
                                  null
                              ? YoutubePlayer(
                                  controller: videoContentController
                                      .youtubePlayerController!,
                                  showVideoProgressIndicator: true,
                                  onReady: () {
                                    videoContentController
                                        .youtubePlayerController!
                                        .addListener(
                                      () {
                                        // Sesuaikan UI atau perilaku berdasarkan status fullscreen
                                        if (videoContentController
                                            .youtubePlayerController!
                                            .value
                                            .isFullScreen) {
                                          SystemChrome.setEnabledSystemUIMode(
                                              SystemUiMode.immersiveSticky);
                                          // Tindakan tambahan saat memasuki fullscreen
                                        } else {
                                          SystemChrome.setEnabledSystemUIMode(
                                              SystemUiMode.edgeToEdge);
                                          // Tindakan tambahan saat keluar dari fullscreen
                                        }
                                      },
                                    );
                                  },
                                  onEnded: (metaData) {
                                    SystemChrome.setPreferredOrientations(
                                      [
                                        DeviceOrientation.portraitUp,
                                        DeviceOrientation.portraitDown,
                                      ],
                                    );
                                  },
                                )
                              : Container(
                                  height: 180,
                                  width: double.infinity,
                                  color: Colors.black,
                                  child: const Center(
                                    child: MyLoading(),
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${detailVideoData!.dataVideo?.title}",
                                style: TextStyleConstant.boldTitle.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                              SpacingConstant.verticalSpacing150,
                              const Divider(
                                color: ColorConstant.netralColor500,
                              ),
                              SpacingConstant.verticalSpacing150,
                              Text(
                                "Deskripsi",
                                style: TextStyleConstant.boldSubtitle.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                              SpacingConstant.verticalSpacing100,
                              Text(
                                "${detailVideoData.dataVideo?.description}",
                                style:
                                    TextStyleConstant.regularParagraph.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SpacingConstant.verticalSpacing150,
                              const Divider(
                                color: ColorConstant.netralColor500,
                              ),
                              SpacingConstant.verticalSpacing075,
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
                                      style: TextStyleConstant.boldSubtitle
                                          .copyWith(
                                        color: ColorConstant.netralColor900,
                                      ),
                                    ),
                                    SpacingConstant.horizontalSpacing150,
                                    detailVideoData.comments != null
                                        ? Text(
                                            "${detailVideoData.comments.length}",
                                            style: TextStyleConstant
                                                .semiboldCaption
                                                .copyWith(
                                              color:
                                                  ColorConstant.netralColor900,
                                            ),
                                          )
                                        : Text(
                                            "0",
                                            style: TextStyleConstant
                                                .semiboldCaption
                                                .copyWith(
                                              color:
                                                  ColorConstant.netralColor900,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              SpacingConstant.verticalSpacing100,
                              detailVideoData.comments != null
                                  ? ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var commentsData =
                                            detailVideoData.comments[index];
                                        return KomentarWidget(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          width: 35,
                                          height: 35,
                                          name: commentsData["user_name"],
                                          kometar: commentsData["comment"],
                                          image: const AssetImage(
                                            "assets/images/video_content/Ellipse 339.png",
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SpacingConstant
                                            .verticalSpacing300;
                                      },
                                      itemCount:
                                          detailVideoData.comments.length,
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      height: 20,
                                      width: double.infinity,
                                      child: Text(
                                        "Belum ada komentar",
                                        style: TextStyleConstant.semiboldCaption
                                            .copyWith(
                                          color: ColorConstant.netralColor600,
                                        ),
                                      ),
                                    ),
                              SpacingConstant.verticalSpacing200,
                              GestureDetector(
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
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                child: Container(
                                                  height: 4,
                                                  width: 64,
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .netralColor600,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
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
                                            SpacingConstant.verticalSpacing200,
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/video_content/arrow_upward.png",
                                                  height: 24,
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
                                            SpacingConstant.verticalSpacing200,
                                            detailVideoData.comments != null
                                                ? Flexible(
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: detailVideoData
                                                          .comments.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var comentVideo =
                                                            detailVideoData
                                                                    .comments[
                                                                index];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      16.5),
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 20),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 45,
                                                                  width: 45,
                                                                  decoration: const BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                ),
                                                                SpacingConstant
                                                                    .horizontalSpacing200,
                                                                Expanded(
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            17,
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              comentVideo["user_name"],
                                                                              style: TextStyleConstant.semiboldCaption.copyWith(
                                                                                color: ColorConstant.netralColor900,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "15 menit",
                                                                              style: TextStyleConstant.regularFooter.copyWith(
                                                                                color: ColorConstant.netralColor600,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SpacingConstant
                                                                          .verticalSpacing100,
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Text(
                                                                          comentVideo[
                                                                              "comment"],
                                                                          style: TextStyleConstant
                                                                              .regularCaption
                                                                              .copyWith(
                                                                            color:
                                                                                ColorConstant.netralColor900,
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
                                                        Alignment.topCenter,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 35),
                                              child: GlobalSearchBar(
                                                controller:
                                                    videoContentController
                                                        .comentController,
                                                prefixIcon: const Icon(
                                                  Icons.person,
                                                  size: 24,
                                                ),
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    // print(videoContentController
                                                    //     .comentController);
                                                    // print(detailVideoData
                                                    //     .dataVideo?.id);
                                                    videoContentService
                                                        .postComment(
                                                            detailVideoData
                                                                .dataVideo!.id!,
                                                            videoContentController
                                                                .comentController
                                                                .text);
                                                  },
                                                  child: const Icon(
                                                    Icons.send,
                                                    size: 16,
                                                    color: ColorConstant
                                                        .netralColor600,
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
                                  child: detailVideoData.comments != null
                                      ? Text(
                                          "Lihat Semua Komentar",
                                          style: TextStyleConstant
                                              .semiboldParagraph
                                              .copyWith(
                                            color: ColorConstant.infoColor500,
                                          ),
                                        )
                                      : Text(
                                          "Tambahkan Komentar",
                                          style: TextStyleConstant
                                              .semiboldParagraph
                                              .copyWith(
                                            color: ColorConstant.infoColor500,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
