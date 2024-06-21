import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/profile_controller.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/screens/video_content/widgets/bottom_sheet_widget.dart';
import 'package:recything_application/screens/video_content/widgets/deskripsi_content.dart';
import 'package:recything_application/screens/video_content/widgets/komentar_widget.dart';
import 'package:recything_application/services/video_content/video_content_service.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideoContentScreen extends StatelessWidget {
  DetailVideoContentScreen({super.key, required this.id});

  final int id;

  final VideoContentController videoContentController =
      Get.put(VideoContentController());

  VideoContentService videoContentService = VideoContentService();
  final ProfileController profileController = Get.put(ProfileController());

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
                                  child: Stack(
                                    children: [
                                      player,
                                      Positioned(
                                        top: 8,
                                        left: 8,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            size: 24,
                                            color: ColorConstant.netralColor800,
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
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
                                              DeskripsiContent(),
                                              SpacingConstant
                                                  .verticalSpacing100,
                                              detailVideoData?.comments !=
                                                          null &&
                                                      detailVideoData
                                                          ?.comments.isNotEmpty
                                                  ? ListView.separated(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        if (index >=
                                                            detailVideoData
                                                                ?.comments
                                                                .length) {
                                                          return Container();
                                                        }
                                                        var commentsData =
                                                            detailVideoData
                                                                    ?.comments[
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
                                              BottomSheetWidget(id: id)
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
