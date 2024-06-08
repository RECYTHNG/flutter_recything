import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/controllers/customer_service_faq_controller.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/item_list_faq_widget.dart';
import 'package:recything_application/screens/customer_service/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class CutomerServiceMainFaqContent extends StatelessWidget {
  const CutomerServiceMainFaqContent({
    super.key,
    required this.customerServiceFaqController,
  });

  final CustomerServiceFaqController customerServiceFaqController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (customerServiceFaqController.isLoading.value) {
          return const Center(
            child: MyLoading(),
          );
        } else if (customerServiceFaqController.error.value.isNotEmpty) {
          return Center(
            child: Text('Error: ${customerServiceFaqController.error.value}'),
          );
        } else if (customerServiceFaqController.faqData.isEmpty) {
          return const Center(
            child: Text('Tidak Ada Data'),
          );
        } else {
          return Column(
            children: customerServiceFaqController.faqData.map((faq) {
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
            }).toList(),
          );
        }
      },
    );
  }
}
