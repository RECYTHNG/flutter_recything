import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/models/recycle/video_recycle_model.dart';
import 'package:recything_application/screens/recycle/widgets/item_video_recycle_widget.dart';
import 'package:recything_application/screens/video_content/detail_video_content_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class VideoCurrentSearchRecycleWidget extends StatelessWidget {
  const VideoCurrentSearchRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    final VideoContentController videoController = Get.put(VideoContentController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchVideo();
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Tampilan Terkini Video',
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
            ],
          ),
          SpacingConstant.verticalSpacing150,
          Obx(
            () {
              if (controller.isLoadingFetchVideo.value || controller.videoDashboardData.value == null) {
                return const SizedBox(
                  height: 250,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyLoading(),
                      ],
                    ),
                  ),
                );
              } else {
                final List<Video> data = controller.videoDashboardData.value!.data.take(2).toList();
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 0),
                  separatorBuilder: (context, index) =>
                      SpacingConstant.verticalSpacing200,
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final video = data[index];
                    return ItemVideoRecycleWidget(
                      thumbnail: video.thumbnailUrl,
                      title: video.title,
                      views: video.viewer,
                      onTap: () {
                        videoController.getDetailVideoContent(video.id);
                        Get.to(() => DetailVideoContentScreen(id: video.id));
                      },
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
