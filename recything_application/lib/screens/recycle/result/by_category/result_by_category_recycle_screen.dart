import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/screens/recycle/result/by_category/widgets/app_bar_result_by_category_widget.dart';
import 'package:recything_application/screens/recycle/result/by_category/widgets/article_result_by_category_widget.dart';
import 'package:recything_application/screens/recycle/result/by_category/widgets/tab_bar_result_by_category_widget.dart';
import 'package:recything_application/screens/recycle/result/by_category/widgets/video_result_by_category_widget.dart';
import 'package:recything_application/utils/system_ui_overlay_utils.dart';

class ResultByCategoryRecycleScreen extends StatelessWidget {
  const ResultByCategoryRecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.whiteColor, true);
    Get.put(RecycleController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppBarResultByCategoryWidget(),
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
            const TabBarResultByCategoryWidget(),
            const Expanded(
              child: TabBarView(
                children: [
                  ArticleResultByCategoryWidget(),
                  VideoResultByCategoryWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
