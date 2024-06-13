import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/customer_service_faq_controller.dart';
import 'package:recything_application/controllers/customer_service_search_controller.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/content/customer_service_main_category_content.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/content/cutomer_service_main_faq_content.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/app_bar_search_widget.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/container_remin_customer_service_widget.dart';

class CustomerServiceScreen extends StatelessWidget {
  CustomerServiceScreen({super.key});

  final CustomerServiceFaqController customerServiceFaqController = Get.put(
    CustomerServiceFaqController(),
  );
  final CustomerServiceSearchController customerServiceSearchController =
      Get.put(
    CustomerServiceSearchController(),
  );

  @override
  Widget build(BuildContext context) {
    customerServiceSearchController.searchController.value.addListener(
      () {
        customerServiceSearchController.onSearchChanged(
            customerServiceSearchController.searchController.value.text);
      },
    );

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Stack(
        children: [
          const SizedBox(
            height: 200.0,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    'Kami Siap Membantu Anda',
                    style: TextStyleConstant.boldSubtitle.copyWith(
                      fontSize: 16.0,
                      color: ColorConstant.netralColor900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SpacingConstant.verticalSpacing400,
                  const CustomerServiceMainCategoryContent(),
                  SpacingConstant.verticalSpacing400,
                  const Divider(
                    color: ColorConstant.netralColor500,
                    thickness: 1.0,
                  ),
                  SpacingConstant.verticalSpacing400,
                  Text(
                    'Pertanyaan yang sering diajukan',
                    style: TextStyleConstant.semiboldParagraph.copyWith(
                      fontSize: 14.0,
                      color: ColorConstant.netralColor600,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SpacingConstant.verticalSpacing200,
                  CutomerServiceMainFaqContent(
                    customerServiceFaqController: customerServiceFaqController,
                  ),
                  SpacingConstant.verticalSpacing300,
                  const ReMinCustomerServiceWidget(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppBarSearchWidget(
                customerServiceSearchController: customerServiceSearchController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
