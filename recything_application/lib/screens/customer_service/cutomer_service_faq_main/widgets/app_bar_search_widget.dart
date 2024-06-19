import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/customer_service_search_controller.dart';
import 'package:recything_application/screens/customer_service/search_result_customer_service/search_result_customer_service_screen.dart';
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';

class AppBarSearchWidget extends StatelessWidget {
  const AppBarSearchWidget({
    super.key,
    required this.customerServiceSearchController,
  });
  final CustomerServiceSearchController customerServiceSearchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
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
                controller:
                    customerServiceSearchController.searchController.value,
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
                    Get.to(
                      () => SearchResultCustomerService(
                        query: value,
                      ),
                    );
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
          ),
        ],
      ),
    );
  }
}
