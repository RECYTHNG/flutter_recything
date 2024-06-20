import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/models/recycle/category/video_category_recycle_model.dart';
import 'package:recything_application/screens/recycle/widgets/item_video_recycle_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class VideoResultByCategoryWidget extends StatelessWidget {
  const VideoResultByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchVideoByCategory();
    });
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SpacingConstant.verticalSpacing150,
            Expanded(
              child: Obx(
                () {
                  if (controller.isLoadingFetchVideoByCategory.value || controller.resultVideoByCategory.value == null) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyLoading(),
                        ],
                      ),
                    );
                  } else {
                    final List<Video> data = controller.resultVideoByCategory.value!.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) => SpacingConstant.verticalSpacing200,
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        final video = data[index];
                        return ItemVideoRecycleWidget(
                          thumbnail: video.urlThumbnail,
                          title: video.title,
                          views: video.viewer,
                          onTap: () {},
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SpacingConstant.verticalSpacing150,
          ],
        ),
      ),
    );
  }
}
