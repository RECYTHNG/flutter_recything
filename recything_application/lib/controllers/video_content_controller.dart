import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:recything_application/controllers/profile_controller.dart';
import 'package:recything_application/models/video_content/detail_video_content_model.dart';
import 'package:recything_application/models/video_content/response_category_model.dart';
import 'package:recything_application/models/video_content/response_search_model.dart';
import 'package:recything_application/models/video_content/video_content_model.dart';
import 'package:recything_application/services/video_content/video_content_service.dart';

class VideoContentController extends GetxController {
  YoutubePlayerController? youtubePlayerController;
  final VideoContentService videoContentService = VideoContentService();
  RxBool isLoading = false.obs;
  RxBool sortComment = true.obs;
  Rxn<VideoContentModel> videoContentData = Rxn<VideoContentModel>();
  Rxn<DetailVideoContentModel> detailVideoContentData =
      Rxn<DetailVideoContentModel>();
  Rxn<ResponseGetCategoryModel> categoryVideoContentData =
      Rxn<ResponseGetCategoryModel>();
  Rxn<VideoContentSearchResponseModel> searchVideoContentData =
      Rxn<VideoContentSearchResponseModel>();
  TextEditingController commentController = TextEditingController();
  RxList<Map<String, dynamic>> idAndTitle = <Map<String, dynamic>>[].obs;

  final ProfileController profileController = Get.put(ProfileController());

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

  String formatNumber(int number) {
    if (number >= 1000 && number < 1000000) {
      return (number / 1000).toStringAsFixed(0) + ' rb';
    } else if (number >= 1000000) {
      return (number / 1000000).toStringAsFixed(1) + ' jt';
    } else {
      return number.toString();
    }
  }

  void getVideoContent() async {
    isLoading.value = true;
    try {
      final response = await videoContentService.getVideoContent();
      if (response.code == 200) {
        videoContentData.value = response;
        for (var item in response.data!) {
          idAndTitle.add({"id": item.id, "title": item.title});
        }
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
      final response = await videoContentService.getDetailVideoContent(
          id, sortComment.value);
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
      await videoContentService.postComment(videoId, comment);
      final newComment = {
        "user_name": profileController.userData.value?.name,
        "comment": comment,
        "user_profile": profileController.userData.value?.pictureUrl,
        "created_at": DateTime.now().toString(),
      };
      if (detailVideoContentData.value?.data?.comments != null) {
        detailVideoContentData.value?.data?.comments?.insert(0, newComment);
      } else {
        detailVideoContentData.value?.data?.comments = [newComment];
      }
      detailVideoContentData.refresh();
      commentController.clear();
    } catch (e) {
      Get.snackbar("Error", "Failed to post comment: $e");
    }
  }

  void getCategoryVideoContent(String name) async {
    isLoading.value = true;
    try {
      final response = await videoContentService.getCategoryVideoContent(name);
      if (response.code == 200) {
        categoryVideoContentData.value = response;
      } else {
        Get.snackbar("Error", response.message.toString());
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void getSearchVideoContent(String keyword) async {
    isLoading.value = true;
    try {
      final response = await videoContentService.getSearchVideoContent(keyword);
      if (response.code == 200) {
        searchVideoContentData.value = response;
      } else {
        Get.snackbar("Error", response.message.toString());
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
