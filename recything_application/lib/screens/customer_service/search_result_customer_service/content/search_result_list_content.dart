import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/customer_service_search_controller.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/item_list_faq_widget.dart';
import 'package:recything_application/screens/customer_service/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/screens/customer_service/search_result_customer_service/widgets/search_not_found_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class SearchResultListContent extends StatelessWidget {
  const SearchResultListContent({
    super.key,
    required this.customerServiceSearchController,
  });

  final CustomerServiceSearchController customerServiceSearchController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (customerServiceSearchController.isLoading.value) {
          return const Center(child: MyLoading());
        } else if (!customerServiceSearchController.isLoading.value &&
            customerServiceSearchController.searchResults.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: customerServiceSearchController.searchResults.length,
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
      },
    );
  }
}
