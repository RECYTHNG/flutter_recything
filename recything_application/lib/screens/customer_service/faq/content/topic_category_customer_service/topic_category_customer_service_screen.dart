import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/customer_service/faq/content/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';

class TopicCategoryCustomerServiceScreen extends StatefulWidget {
  final String title;
  const TopicCategoryCustomerServiceScreen({super.key, required this.title});

  @override
  State<TopicCategoryCustomerServiceScreen> createState() =>
      _TopicCategoryCustomerServiceScreenState();
}

class _TopicCategoryCustomerServiceScreenState
    extends State<TopicCategoryCustomerServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Topik : ${widget.title}',
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
              color: ColorConstant.netralColor500,
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
              color: ColorConstant.netralColor500,
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
      ),
    );
  }
}
