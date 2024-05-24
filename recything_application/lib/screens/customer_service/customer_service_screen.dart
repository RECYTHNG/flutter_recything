import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/customer_service/widgets/item_category_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/widgets/container_remin_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/content/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
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
                const GlobalSearchBar(
                  height: 40.0,
                  width: double.infinity,
                  hintText: 'Search',
                ),
                SpacingConstant.verticalSpacing300,
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemCategoryCustomerService(
                          title: 'Profil',
                          image: ImageConstant.profileCutomerService,
                        ),
                        ItemCategoryCustomerService(
                          title: 'Littering',
                          image: ImageConstant.litteringCutomerService,
                        ),
                        ItemCategoryCustomerService(
                          title: 'Rubbish',
                          image: ImageConstant.rubbishCutomerService,
                        ),
                        ItemCategoryCustomerService(
                          title: 'Misi',
                          image: ImageConstant.misiCutomerService,
                        ),
                      ],
                    ),
                    SpacingConstant.verticalSpacing400,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemCategoryCustomerService(
                          title: 'Lokasi Sampah',
                          image: ImageConstant.lokasiCutomerService,
                        ),
                        ItemCategoryCustomerService(
                          title: 'Poin',
                          image: ImageConstant.poinService,
                        ),
                        ItemCategoryCustomerService(
                          title: 'Artikel',
                          image: ImageConstant.artikelCutomerService,
                        ),
                        ItemCategoryCustomerService(
                          title: 'Syarat &\nKetentuan',
                          image: ImageConstant.snkCutomerService,
                        ),
                      ],
                    ),
                  ],
                ),
                SpacingConstant.verticalSpacing400,
                const Divider(
                  color: ColorConstant.netralColor600,
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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bagaimana cara mengatasi kesalahan \ndalam mengisi detail pengguna?',
                          style: TextStyleConstant.semiboldCaption.copyWith(
                            fontSize: 12.0,
                            color: ColorConstant.netralColor900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DetailAnswerFAQorOtherScreen(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: ColorConstant.netralColor900,
                          ),
                        ),
                      ],
                    ),
                    SpacingConstant.verticalSpacing200,
                    const Divider(
                      color: ColorConstant.netralColor600,
                      thickness: 1.0,
                    ),
                    SpacingConstant.verticalSpacing200,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Apakah ada batasan jumlah poin yang \ndapat saya kumpulkan?',
                          style: TextStyleConstant.semiboldCaption.copyWith(
                            fontSize: 12.0,
                            color: ColorConstant.netralColor900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: ColorConstant.netralColor900,
                          ),
                        ),
                      ],
                    ),
                    SpacingConstant.verticalSpacing200,
                    const Divider(
                      color: ColorConstant.netralColor600,
                      thickness: 1.0,
                    ),
                    SpacingConstant.verticalSpacing200,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Saya melaporkan tumpukan sampah, tetapi \ntidak ada tanggapan. Apa yang harus saya \nlakukan?',
                          style: TextStyleConstant.semiboldCaption.copyWith(
                            fontSize: 12.0,
                            color: ColorConstant.netralColor900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: ColorConstant.netralColor900,
                          ),
                        ),
                      ],
                    ),
                  ],
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
