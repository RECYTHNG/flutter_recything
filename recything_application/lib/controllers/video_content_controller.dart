import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/video_content/detail_video_content_model.dart';
import 'package:recything_application/models/video_content/video_content_model.dart';
import 'package:recything_application/services/Video_content/video_content_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoContentController extends GetxController {
  YoutubePlayerController? youtubePlayerController;
  final VideoContentService videoContentService = VideoContentService();
  RxBool isLoading = false.obs;
  Rxn<VideoContentModel> videoContentData = Rxn<VideoContentModel>();
  Rxn<DetailVideoContentModel> detailVideoContentData =
      Rxn<DetailVideoContentModel>();
  RxBool scrollable = true.obs;

  TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    youtubePlayerController?.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    getVideoContent();
  }

  void getVideoContent() async {
    isLoading.value = true;
    try {
      final response = await videoContentService.getVideoContent();
      if (response.code == 200) {
        videoContentData.value = response;
      } else {
        Get.snackbar("Error", response.message.toString());
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void getDetailVideoContent(int id) async {
    isLoading.value = true;
    try {
      final response = await videoContentService.getDetailVideoContent(id);
      if (response.code == 200) {
        detailVideoContentData.value = response;
        playVideo(detailVideoContentData.value?.data?.dataVideo?.linkVideo);
      } else {
        Get.snackbar("Error", response.message.toString());
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void playVideo(String? url) {
    if (url == null || url.isEmpty) {
      Get.snackbar("Error", "Invalid video URL");
      return;
    }
    String? videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId == null) {
      Get.snackbar("Error", "Could not extract video ID");
      return;
    }
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    update();
  }

  void postComment(int videoId, String comment) async {
    try {
      videoContentService.postComment(videoId, comment);
      // Add comment locally to the current comments list
      detailVideoContentData.value?.data?.comments?.add({
        "user_name": "Current User",
        "comment": comment,
        "user_profile":
            "https://res.cloudinary.com/dymhvau8n/image/upload/v1718189121/user_badge/htaemsjtlhfof7ww01ss.png",
        "created_at": DateTime.now().toString(),
      });
      detailVideoContentData.refresh();
      Get.snackbar("Success", "Comment posted successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to post comment: $e");
    }
  }
}
