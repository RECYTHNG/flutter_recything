import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/customer_service_search_controller.dart';
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';

class SearchResultSearchBarContent extends StatelessWidget {
  const SearchResultSearchBarContent({
    super.key,
    required this.customerServiceSearchController,
  });

  final CustomerServiceSearchController customerServiceSearchController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: GlobalAutocompleteSearchBar(
          height: 48.0,
          width: double.infinity,
          controller: customerServiceSearchController.searchController.value,
          matchedSearchData: customerServiceSearchController.matchData,
          hintText: 'Search',
          query: customerServiceSearchController.queryInput.value,
          onSubmitted: (value) {
            customerServiceSearchController.searchFaq(value);
          },
          onChanged: (value) {
            customerServiceSearchController.onChangedQuery(value);
          },
          onResultSelected: (newValue) {
            customerServiceSearchController.onClickMatchedResult(newValue);
          },
        ),
      ),
    );
  }
}
