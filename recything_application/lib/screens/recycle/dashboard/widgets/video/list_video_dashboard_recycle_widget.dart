import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/models/recycle/video_recycle_model.dart';
import 'package:recything_application/screens/recycle/dashboard/widgets/video/subheader_video_dashboard_recycle_widget.dart';
import 'package:recything_application/screens/recycle/widgets/item_simple_video_recycle_widget.dart';
import 'package:recything_application/screens/video_content/detail_video_content_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class ListVideoDashboardRecycleWidget extends StatelessWidget {
  const ListVideoDashboardRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    final VideoContentController videoController = Get.put(VideoContentController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchVideo();
    });
    return Column(
      children: [
        const SubheaderVideoDashboardRecycleWidget(),
        SpacingConstant.verticalSpacing150,
        Obx(
          () {
            if (controller.isLoadingFetchVideo.value) {
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
              final List<Video> dataToShow = controller.videoDashboardData.value!.data.take(3).toList();
              return SizedBox(
                height: 234,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SpacingConstant.horizontalSpacing200,
                  scrollDirection: Axis.horizontal,
                  itemCount: dataToShow.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    final video = dataToShow[index];
                    return ItemSimpleVideoRecycleWidget(
                      onTap: () {
                        videoController.getDetailVideoContent(video.id);
                        Get.to(() => DetailVideoContentScreen(id: video.id));
                      },
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
