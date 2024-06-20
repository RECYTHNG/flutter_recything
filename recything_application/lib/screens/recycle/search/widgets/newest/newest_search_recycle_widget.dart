import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/recycle/search/widgets/newest/article_newest_search_recycle_widget.dart';
import 'package:recything_application/screens/recycle/search/widgets/newest/video_newest_search_recycle_widget.dart';

class NewestSearchRecycleWidget extends StatelessWidget {
  const NewestSearchRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Eksplor Konten Terbaru',
                style: TextStyleConstant.boldSubtitle.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
            ],
          ),
          SpacingConstant.verticalSpacing150,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Yuk Baca Artikel Terbaru Disini!',
                style: TextStyleConstant.regularParagraph.copyWith(
                  color: ColorConstant.blackColor,
                ),
              ),
            ],
          ),
          SpacingConstant.verticalSpacing100,
          const ArticleNewestSearchRecycleWidget(),
          SpacingConstant.verticalSpacing150,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Yuk Tonton Video Terbaru Disini!',
                style: TextStyleConstant.regularParagraph.copyWith(
                  color: ColorConstant.blackColor,
                ),
              ),
            ],
          ),
          SpacingConstant.verticalSpacing100,
          const VideoNewestSearchRecycleWidget()
        ],
      ),
    );
  }
}
