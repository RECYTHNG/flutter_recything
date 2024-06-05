import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/customer_service/cutomer_service_faq_main/widgets/item_category_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/syarat_dan_ketentuan_customer_sevice_screen/syarat_dan_ketentuan_customer_service_screen.dart';
import 'package:recything_application/screens/customer_service/topic_category_customer_service/topic_category_customer_service_screen.dart';

class CustomerServiceMainCategoryContent extends StatelessWidget {
  const CustomerServiceMainCategoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ItemCategoryCustomerService(
              title: 'Profil',
              image: ImageConstant.profileCutomerService,
              onTap: () {
                Get.to(
                  () => TopicCategoryCustomerServiceScreen(
                    title: 'Profil',
                    category: 'profil',
                  ),
                );
              },
            ),
            ItemCategoryCustomerService(
              title: 'Littering',
              image: ImageConstant.litteringCutomerService,
              onTap: () {
                Get.to(
                  () => TopicCategoryCustomerServiceScreen(
                    title: 'Littering',
                    category: 'littering',
                  ),
                );
              },
            ),
            ItemCategoryCustomerService(
              title: 'Rubbish',
              image: ImageConstant.rubbishCutomerService,
              onTap: () {
                Get.to(
                  () => TopicCategoryCustomerServiceScreen(
                    title: 'Rubbish',
                    category: 'rubbish',
                  ),
                );
              },
            ),
            ItemCategoryCustomerService(
              title: 'Misi',
              image: ImageConstant.misiCutomerService,
              onTap: () {
                Get.to(
                  () => TopicCategoryCustomerServiceScreen(
                    title: 'Misi',
                    category: 'misi',
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
                Get.to(
                  () => TopicCategoryCustomerServiceScreen(
                    title: 'Lokasi Sampah',
                    category: 'lokasi sampah',
                  ),
                );
              },
            ),
            ItemCategoryCustomerService(
              title: 'Poin',
              image: ImageConstant.poinService,
              onTap: () {
                Get.to(
                  () => TopicCategoryCustomerServiceScreen(
                    title: 'Poin',
                    category: 'poin dan level',
                  ),
                );
              },
            ),
            ItemCategoryCustomerService(
              title: 'Artikel',
              image: ImageConstant.artikelCutomerService,
              onTap: () {
                Get.to(
                  () => TopicCategoryCustomerServiceScreen(
                    title: 'Artikel',
                    category: 'artikel',
                  ),
                );
              },
            ),
            ItemCategoryCustomerService(
              title: 'Syarat &\nKetentuan',
              image: ImageConstant.snkCutomerService,
              onTap: () {
                Get.to(
                  () => const SyaratDanKetentuanCustomerServiceScreen(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
