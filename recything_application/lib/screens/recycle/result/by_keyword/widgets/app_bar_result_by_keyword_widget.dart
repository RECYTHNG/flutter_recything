import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';

class AppBarResultByKeywordWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarResultByKeywordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorConstant.netralColor900,
                      size: 24,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  SpacingConstant.horizontalSpacing100,
                  Expanded(
                    child: Obx(
                      () {
                        return GlobalAutocompleteSearchBar(
                          controller:controller.resultByKeywordController,
                          hintText: 'Search',
                          height: 40,
                          width: 500,
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
