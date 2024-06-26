import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/home_controller.dart';
import 'package:recything_application/controllers/video_content_controller.dart';
import 'package:recything_application/screens/video_content/detail_video_content_screen.dart';
import 'package:recything_application/screens/video_content/video_content_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class NewVideoSectionWidget extends StatelessWidget {
  NewVideoSectionWidget({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final VideoContentController videoController = Get.put(VideoContentController());
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 24,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Video Terkini',
                    style: TextStyleConstant.boldSubtitle,
                  ),
                  Text(
                    'Yuk Tonton Video Terkini Disini!',
                    style: TextStyleConstant.regularParagraph,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.to(VideoContentScreen());
                },
                child: Text(
                  'Lihat Semua',
                  style: TextStyleConstant.semiboldCaption.copyWith(
                    color: ColorConstant.primaryColor500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Obx(() {
            return Container(
              decoration: BoxDecoration(
                boxShadow: ShadowConstant.shadowLg,
              ),
              height: 234,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.videos.length,
                itemBuilder: (context, index) {
                  final item = controller.videos[index];
                  final imagePath =
                      item['url_thumbnail'] ?? 'default_image_path.png';
                  final title = item['title'] ?? 'Default Title';
                  final views = (item['viewer']);

                  String formattedViews;
                  if (views >= 1000) {
                    formattedViews = '${(views / 1000).toStringAsFixed(0)} rb';
                  } else {
                    formattedViews = '$views';
                  }

                  return GestureDetector(
                    onTap: () {
                      videoController.getDetailVideoContent(item['id']);
                      Get.to(() => DetailVideoContentScreen(id: item['id']));
                    },
                    child: Container(
                      height: 234,
                      width: 166,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: Image.network(
                                    imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Icon(
                                  Icons.play_circle,
                                  size: 32,
                                  color: ColorConstant.whiteColor,
                                ),
                              ],
                            ),
                            Text(
                              title,
                              style: TextStyleConstant.semiboldParagraph,
                              maxLines: 2,
                            ),
                            Text(
                              '$formattedViews ditonton',
                              style: TextStyleConstant.regularFooter,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
