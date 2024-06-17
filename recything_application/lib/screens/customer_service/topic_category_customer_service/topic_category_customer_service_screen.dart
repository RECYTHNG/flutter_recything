import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/customer_service_main_category_controller.dart';
import 'package:recything_application/screens/customer_service/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/item_list_faq_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class TopicCategoryCustomerServiceScreen extends StatelessWidget {
  final String title;
  final String category;
  TopicCategoryCustomerServiceScreen({
    super.key,
    required this.title,
    required this.category,
  });

  final CustomerServiceMainCategoryController
      customerServiceCategoryController = Get.put(
    CustomerServiceMainCategoryController(),
  );

  @override
  Widget build(BuildContext context) {
    customerServiceCategoryController.fetchFaqData(category);
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Topik : $title',
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
        child: Obx(
          () {
            if (customerServiceCategoryController.isLoading.value) {
              return const Center(
                child: MyLoading(),
              );
            } else if (customerServiceCategoryController
                .errorMessage.isNotEmpty) {
              return const Center(
                child: Text('Opps! Ada Kesalahan'),
              );
            } else {
              return ListView.builder(
                itemCount:
                    customerServiceCategoryController.faqCategoryData.length,
                itemBuilder: (context, index) {
                  final faq =
                      customerServiceCategoryController.faqCategoryData[index];
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
              );
            }
          },
        ),
      ),
    );
  }
}
