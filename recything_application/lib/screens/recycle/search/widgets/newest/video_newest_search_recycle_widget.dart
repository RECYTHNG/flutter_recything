import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/models/recycle/video_recycle_model.dart';
import 'package:recything_application/screens/recycle/widgets/item_simple_video_recycle_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class VideoNewestSearchRecycleWidget extends StatelessWidget {
  const VideoNewestSearchRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchVideo();
    });
    return Column(
      children: [
        Obx(
          () {
            if (controller.isLoadingFetchVideo.value || controller.videoDashboardData.value == null) {
              return const SizedBox(
                height: 234,
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
              final List<Video> dataToShow =
                  controller.videoDashboardData.value!.data.sublist(
                controller.videoDashboardData.value!.data.length - 3,
                controller.videoDashboardData.value!.data.length,
              );
              return SizedBox(
                height: 234,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SpacingConstant.horizontalSpacing200,
                  scrollDirection: Axis.horizontal,
                  itemCount: dataToShow.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    final video = dataToShow[index];
                    return ItemSimpleVideoRecycleWidget(
                      onTap: () {},
                      thumbnail: video.thumbnailUrl,
                      title: video.title,
                      views: video.viewer,
                    );
                  },
                ),
              );
            }
          },
        )
      ],
    );
  }
}
