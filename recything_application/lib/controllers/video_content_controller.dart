import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/video_content/detail_video_content_model.dart';
import 'package:recything_application/models/video_content/video_content_model.dart';
import 'package:recything_application/services/Video_content/video_content_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoContentController extends GetxController {
  // FlickManager? flickManager;
  YoutubePlayerController? youtubePlayerController;
  final VideoContentService videoContentService = VideoContentService();
  RxBool isLoading = false.obs;
  Rxn<VideoContentModel> videoContentData = Rxn<VideoContentModel>();
  Rxn<DetailVideoContentModel> detailVideoContentData =
      Rxn<DetailVideoContentModel>();
  RxBool scrollable = true.obs;

  TextEditingController comentController = TextEditingController();

  @override
  void dispose() {
    comentController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    getVideoContent();
  }

  void getVideoContent() async {
    isLoading.value = true;
    final response = await videoContentService.getVideoContent();
    try {
      if (response.code == 200) {
        videoContentData.value = response;
      } else {
        Get.snackbar(
          "Error",
          response.message.toString(),
        );
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred : $e");
    } finally {
      isLoading.value = false;
    }
  }

  void getDetailVideoContent(int id) async {
    isLoading.value = true;
    final response = await videoContentService.getDetailVideoContent(id);
    try {
      if (response.code == 200) {
        detailVideoContentData.value = response;
        playVideo(detailVideoContentData.value?.data!.dataVideo?.linkVideo);
        // print(detailVideoContentData.value?.data!.dataVideo?.title);
      } else {
        Get.snackbar(
          "Error",
          response.message.toString(),
        );
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred : $e");
    } finally {
      isLoading.value = false;
    }
  }

  // void playVideo() {
  //   flickManager = FlickManager(
  //     videoPlayerController: VideoPlayerController.networkUrl(
  //       Uri.parse(
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
  //     ),
  //   );
  // }
  void playVideo(String? url) {
    String videoId = YoutubePlayer.convertUrlToId(url!) ?? "";
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    update();
  }
}
