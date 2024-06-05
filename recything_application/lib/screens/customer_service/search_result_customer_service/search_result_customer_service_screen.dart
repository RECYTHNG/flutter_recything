import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/customer_service_search_controller.dart';
import 'package:recything_application/screens/customer_service/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/screens/customer_service/search_result_customer_service/widgets/search_not_found_widget.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/item_list_faq_widget.dart';
import 'package:recything_application/widgets/global_autocomplete_search_bar.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class SearchResultCustomerService extends StatefulWidget {
  final String query;
  const SearchResultCustomerService({
    super.key,
    required this.query,
  });

  @override
  State<SearchResultCustomerService> createState() =>
      _SearchResultCustomerServiceState();
}

class _SearchResultCustomerServiceState
    extends State<SearchResultCustomerService> {
  final CustomerServiceSearchController customerServiceSearchController =
      Get.put(
    CustomerServiceSearchController(),
  );

  @override
  void initState() {
    super.initState();
    customerServiceSearchController.searchFaq(widget.query);
    customerServiceSearchController.searchController.value.addListener(
      () {
        customerServiceSearchController.onSearchChanged(
            customerServiceSearchController.searchController.value.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Pencarian',
          style: TextStyleConstant.boldTitle.copyWith(
            fontSize: 16.0,
            color: ColorConstant.netralColor800,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: ColorConstant.whiteColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
              () => Flexible(
                child: GlobalAutocompleteSearchBar(
                  height: 48.0,
                  width: double.infinity,
                  controller:
                      customerServiceSearchController.searchController.value,
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
                    customerServiceSearchController
                        .onClickMatchedResult(newValue);
                  },
                ),
              ),
            ),
            SpacingConstant.verticalSpacing200,
            Obx(() {
              if (customerServiceSearchController.isLoading.value) {
                return const Center(child: MyLoading());
              } else if (!customerServiceSearchController.isLoading.value &&
                  customerServiceSearchController.searchResults.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        customerServiceSearchController.searchResults.length,
                    itemBuilder: (context, index) {
                      final faq =
                          customerServiceSearchController.searchResults[index];
                      return ItemListFaqWidget(
                        question: faq.question ?? '',
                        onTap: () {
                          Get.to(
                            () => DetailAnswerFAQorOtherScreen(
                              question: faq.question ?? '',
                              answer: faq.answer ?? '',
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return const SearchingNotFoundWidget();
              }
            }),
          ],
        ),
      ),
    );
  }
}
