import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/screens/recycle/result/by_keyword/widgets/app_bar_result_by_keyword_widget.dart';
import 'package:recything_application/screens/recycle/result/by_keyword/widgets/article_result_by_keyword_widget.dart';
import 'package:recything_application/screens/recycle/result/by_keyword/widgets/tab_bar_result_by_keyword_widget.dart';
import 'package:recything_application/screens/recycle/result/by_keyword/widgets/video_result_by_keyword_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class ResultByKeywordRecycleScreen extends StatelessWidget {
  const ResultByKeywordRecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.whiteColor, true);
    Get.put(RecycleController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppBarResultByKeywordWidget(),
        backgroundColor: ColorConstant.whiteColor,
        body: Column(
          children: [
            SpacingConstant.verticalSpacing100,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sesuai Pencarian...',
                    style: TextStyleConstant.boldSubtitle.copyWith(
                      color: ColorConstant.netralColor900,
                    ),
                  ),
                ],
              ),
            ),
            SpacingConstant.verticalSpacing100,
            const TabBarResultByKeywordWidget(),
            const Expanded(
              child: TabBarView(
                children: [
                  ArticleResultByKeywordWidget(),
                  VideoResultByKeywordWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
