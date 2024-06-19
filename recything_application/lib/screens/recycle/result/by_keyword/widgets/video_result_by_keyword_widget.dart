import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/models/recycle/category/video_category_recycle_model.dart';
import 'package:recything_application/screens/recycle/result/by_keyword/widgets/empty_state_video_result_by_keyword_widget.dart';
import 'package:recything_application/screens/recycle/widgets/item_video_recycle_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class VideoResultByKeywordWidget extends StatelessWidget {
  const VideoResultByKeywordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchVideoByKeyword();
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
                  if (controller.isLoadingFetchVideoByKeyword.value || controller.resultVideoByKeyword.value == null) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyLoading(),
                        ],
                      ),
                    );
                  } else if (controller.resultVideoByKeyword.value!.data.isEmpty) {
                    return const EmptyStateVideoResultByKeywordWidget();
                  } else {
                    final List<Video> data = controller.resultVideoByKeyword.value!.data;
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
