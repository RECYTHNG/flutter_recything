import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class SearchMapsReportRubbishWidget extends StatelessWidget {
  const SearchMapsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportRubbishController controller = Get.find();
    return Obx(
      () {
        return GlobalAutocompleteSearchBar(
          hintText: 'Search',
          height: 40,
          width: double.infinity,
          controller: controller.searchController,
          matchedSearchData: controller.autocomplete.value,
          query: controller.searchQuery.value,
          onSubmitted: (value) {
            controller.onSubmitSearch(value);
          },
          onChanged: (value) => controller.onChangeQuery(value),
          onResultSelected: (value) {},
        );
      },
    );
  }
}
