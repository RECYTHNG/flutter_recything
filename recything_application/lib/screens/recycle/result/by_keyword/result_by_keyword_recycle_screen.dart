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
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';

class ResultByKeywordRecycleScreen extends StatelessWidget {
  const ResultByKeywordRecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils().setSystemUiOverlay(ColorConstant.whiteColor, true);
    final RecycleController controller = Get.put(RecycleController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        body: Stack(
          children: [
            Column(
              children: [
                const AppBarResultByKeywordWidget(),
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
            Positioned(
              top: 40,
              left: 40,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                color: Colors.transparent,
                child: Obx(
                  () {
                    return GlobalAutocompleteSearchBar(
                      controller: controller.resultByKeywordController,
                      hintText: 'Search',
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      query: controller.searchQuery.value,
                      matchedSearchData: controller.matchedData.value,
                      onChanged: (value) {
                        controller.onChangedQuerySearchBar(value);
                      },
                      onResultSelected: (value) {
                        controller.onClickMatchedResult(value);
                      },
                      handleClearedController: () {
                        controller.matchedData.clear();
                      },
                      onSubmitted: (value) {
                        controller.onSubmittedSearchResultPage(value);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
