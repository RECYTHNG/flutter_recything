import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';

class SearchMapsReportLitterWidget extends StatelessWidget {
  const SearchMapsReportLitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportLitterController controller = Get.find();
    return Obx(
      () {
        return GlobalAutocompleteSearchBar(
          hintText: 'Search',
          height: 40,
          width: double.infinity,
          controller: controller.searchController,
          matchedSearchData: controller.autocomplete,
          query: controller.searchQuery.value,
          onSubmitted: (value) {
            controller.onSubmitSearch(value);
          },
          onChanged: (value) => controller.onChangeQuery(value),
          onResultSelected: (value) {
            controller.onSearchResultSelected(value);
          },
          handleClearedController: () => controller.onClearedController(),
        );
      },
    );
  }
}
