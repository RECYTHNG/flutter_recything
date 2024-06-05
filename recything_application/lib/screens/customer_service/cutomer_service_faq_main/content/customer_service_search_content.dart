import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/customer_service_faq_controller.dart';
import 'package:recything_application/screens/customer_service/search_result_customer_service/search_result_customer_service_screen.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class CustomerServiceSearchContent extends StatelessWidget {
  const CustomerServiceSearchContent({
    super.key,
    required this.customerServiceFaqController,
  });

  final CustomerServiceFaqController customerServiceFaqController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalSearchBar(
        height: 40.0,
        width: double.infinity,
        hintText: 'Search',
        controller: customerServiceFaqController.searchController.value,
        onSubmitted: (value) {
          Get.to(
            () => SearchResultCustomerService(query: value),
          );
        },
      ),
    );
  }
}