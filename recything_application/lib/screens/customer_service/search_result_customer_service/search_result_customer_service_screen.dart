import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/customer_service_search_controller.dart';
import 'package:recything_application/screens/customer_service/search_result_customer_service/content/search_result_list_content.dart';
import 'package:recything_application/screens/customer_service/search_result_customer_service/content/search_result_search_bar_content.dart';

class SearchResultCustomerService extends StatelessWidget {
  final String query;
  SearchResultCustomerService({
    super.key,
    required this.query,
  });

  final CustomerServiceSearchController customerServiceSearchController =
      Get.put(
    CustomerServiceSearchController(),
  );

  @override
  Widget build(BuildContext context) {
    customerServiceSearchController.searchFaq(query);
    customerServiceSearchController.searchController.value.addListener(
      () {
        customerServiceSearchController.onSearchChanged(
            customerServiceSearchController.searchController.value.text);
      },
    );
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
            SearchResultSearchBarContent(
                customerServiceSearchController:
                    customerServiceSearchController),
            SpacingConstant.verticalSpacing200,
            SearchResultListContent(
                customerServiceSearchController:
                    customerServiceSearchController),
          ],
        ),
      ),
    );
  }
}
