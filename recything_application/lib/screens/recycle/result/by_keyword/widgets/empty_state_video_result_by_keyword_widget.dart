import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/models/recycle/video_recycle_model.dart';
import 'package:recything_application/screens/recycle/widgets/item_video_recycle_widget.dart';
import 'package:recything_application/screens/video_content/detail_video_content_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class EmptyStateVideoResultByKeywordWidget extends StatelessWidget {
  const EmptyStateVideoResultByKeywordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    final VideoContentController videoController = Get.put(VideoContentController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchVideo();
    });
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageConstant.notFound, width: 268),
            ],
          ),
          SpacingConstant.verticalSpacing075,
          Text(
            'Waduhh, pencarianmu tidak ada nih!',
            style: TextStyleConstant.boldParagraph.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          Text(
            'Kami tidak mendapatkan apa yang kamu maksud :(',
            style: TextStyleConstant.mediumCaption.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          Text(
            'Lakukan Search ulang, yuk!',
            style: TextStyleConstant.boldCaption.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          SpacingConstant.verticalSpacing500,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Saran Lain yang Mungkin Sesuai',
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
            ],
          ),
          SpacingConstant.verticalSpacing100,
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
                final List<Video> data = controller.videoDashboardData.value!.data.sublist(
                  controller.videoDashboardData.value!.data.length - 2,
                  controller.videoDashboardData.value!.data.length,
                );
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  separatorBuilder: (context, index) => SpacingConstant.verticalSpacing200,
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
          )
        ],
      ),
    );
  }
}
