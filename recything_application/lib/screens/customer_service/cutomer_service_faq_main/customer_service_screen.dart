import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/customer_service_faq_controller.dart';
import 'package:recything_application/screens/customer_service/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/screens/customer_service/search_result_customer_service/search_result_customer_service_screen.dart';
import 'package:recything_application/screens/customer_service/syarat_dan_ketentuan_customer_sevice_screen/syarat_dan_ketentuan_customer_service_screen.dart';
import 'package:recything_application/screens/customer_service/topic_category_customer_service/topic_category_customer_service_screen.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/container_remin_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/item_category_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/item_list_faq_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class CustomerServiceScreen extends StatelessWidget {
  CustomerServiceScreen({super.key});

  final CustomerServiceFaqController customerServiceFaqController = Get.put(
    CustomerServiceFaqController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kami Siap Membantu Anda',
                  style: TextStyleConstant.boldSubtitle.copyWith(
                    fontSize: 16.0,
                    color: ColorConstant.netralColor900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpacingConstant.verticalSpacing300,
                Obx(
                  () => GlobalSearchBar(
                    height: 40.0,
                    width: double.infinity,
                    hintText: 'Search',
                    controller:
                        customerServiceFaqController.searchController.value,
                    onSubmitted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchResultCustomerService(query: value),
                        ),
                      );
                    },
                  ),
                ),
                SpacingConstant.verticalSpacing300,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemCategoryCustomerService(
                          title: 'Profil',
                          image: ImageConstant.profileCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                        title: 'Profil', category: 'profil'),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Littering',
                          image: ImageConstant.litteringCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Littering',
                                  category: 'littering',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Rubbish',
                          image: ImageConstant.rubbishCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Rubbish',
                                  category: 'rubbish',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Misi',
                          image: ImageConstant.misiCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Misi',
                                  category: 'misi',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SpacingConstant.verticalSpacing400,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemCategoryCustomerService(
                          title: 'Lokasi Sampah',
                          image: ImageConstant.lokasiCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Lokasi Sampah',
                                  category: 'lokasi sampah',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Poin',
                          image: ImageConstant.poinService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Poin',
                                  category: 'poin dan level',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Artikel',
                          image: ImageConstant.artikelCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Artikel',
                                  category: 'artikel',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Syarat &\nKetentuan',
                          image: ImageConstant.snkCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SyaratDanKetentuanCustomerServiceScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
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
                Obx(
                  () {
                    if (customerServiceFaqController.isLoading.value) {
                      return const Center(
                        child: MyLoading(),
                      );
                    } else if (customerServiceFaqController
                        .error.value.isNotEmpty) {
                      return Center(
                        child: Text(
                            'Error: ${customerServiceFaqController.error.value}'),
                      );
                    } else if (customerServiceFaqController.faqData.isEmpty) {
                      return const Center(
                        child: Text('Tidak Ada Data'),
                      );
                    } else {
                      return Column(
                        children:
                            customerServiceFaqController.faqData.map((faq) {
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
                ),
                SpacingConstant.verticalSpacing300,
                const ReMinCustomerServiceWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
