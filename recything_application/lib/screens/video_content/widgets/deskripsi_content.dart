import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/video_content_controller.dart';

class DeskripsiContent extends StatelessWidget {
  DeskripsiContent({super.key});
  final VideoContentController videoContentController =
      Get.put(VideoContentController());
  @override
  Widget build(BuildContext context) {
    var detailVideoData =
        videoContentController.detailVideoContentData.value?.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${detailVideoData!.dataVideo?.title}",
          style: TextStyleConstant.boldTitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        SpacingConstant.verticalSpacing150,
        const Divider(
          color: ColorConstant.netralColor500,
        ),
        SpacingConstant.verticalSpacing150,
        Text(
          "Deskripsi",
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        SpacingConstant.verticalSpacing100,
        Text(
          "${detailVideoData?.dataVideo?.description}",
          style: TextStyleConstant.regularParagraph.copyWith(
            color: ColorConstant.netralColor900,
          ),
          textAlign: TextAlign.justify,
        ),
        SpacingConstant.verticalSpacing150,
        const Divider(
          color: ColorConstant.netralColor500,
        ),
        SpacingConstant.verticalSpacing075,
        Container(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
          ),
          height: 44,
          width: double.infinity,
          child: Row(
            children: [
              Text(
                "Komentar",
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
              SpacingConstant.horizontalSpacing150,
              detailVideoData?.comments != null
                  ? Text(
                      "${detailVideoData?.comments.length}",
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.netralColor900,
                      ),
                    )
                  : Text(
                      "0",
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.netralColor900,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
