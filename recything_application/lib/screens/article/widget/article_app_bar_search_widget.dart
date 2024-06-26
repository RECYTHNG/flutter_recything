import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/article_controller.dart';
import 'package:recything_application/controllers/article_search_controller.dart';
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';

class ArticleAppBarSearchWidget extends StatelessWidget {
  const ArticleAppBarSearchWidget({
    super.key,
    required this.articleSearchController,
    required this.onSubmitted,
    this.articleController,
  });
  final ArticleSearchController articleSearchController;
  final dynamic Function(String) onSubmitted;
  final ArticleController? articleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: -10,
            child: SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                onPressed: () {
                  Get.back();
                  articleController?.setKeyword('');
                  articleSearchController.clear();
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: ColorConstant.netralColor900,
                  size: 24.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Obx(
              () => GlobalAutocompleteSearchBar(
                height: 48.0,
                width: double.infinity,
                hintText: 'Search',
                controller: articleSearchController.searchController.value,
                matchedSearchData: articleSearchController.matchData,
                handleClearedController: () {
                  articleSearchController.onChangedQuery('');
                },
                query: articleSearchController.queryInput.value,
                onSubmitted: onSubmitted,
                onChanged: (value) {
                  articleSearchController.onChangedQuery(value);
                },
                onResultSelected: (newValue) {
                  articleSearchController.onClickMatchedResult(newValue);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
