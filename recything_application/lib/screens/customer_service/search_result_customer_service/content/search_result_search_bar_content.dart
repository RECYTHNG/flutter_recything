import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
          hintText: 'Search',
          controller: customerServiceSearchController.searchController.value,
          matchedSearchData: customerServiceSearchController.matchData,
          handleClearedController: () {
            customerServiceSearchController.onChangedQuery('');
          },
          query: customerServiceSearchController.queryInput.value,
          onSubmitted: (value) {
            if (value.isEmpty) {
              Get.snackbar(
                '',
                '',
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(12),
                snackStyle: SnackStyle.FLOATING,
                backgroundColor: Colors.transparent,
                barBlur: 0.0,
                overlayBlur: 0.0,
                snackPosition: SnackPosition.BOTTOM,
                messageText: AwesomeSnackbarContent(
                  title: 'Gagal',
                  message: 'Tidak Boleh Kosong',
                  contentType: ContentType.failure,
                ),
              );
            } else {
              customerServiceSearchController.searchFaq(value);
            }
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
