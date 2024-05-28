import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/homepage/widgets/custom_carousel_item_widget.dart';

class ReportSectionWidget extends StatelessWidget {
  final List<Map<String, String>> carouselData;

  const ReportSectionWidget({super.key, required this.carouselData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 24,
            left: 24,
            top: 24,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingin Laporkan Sampah?',
                        style: TextStyleConstant.boldSubtitle,
                      ),
                      Text(
                        'Pilih Jenis Pelaporan Disini',
                        style: TextStyleConstant.regularParagraph,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        FlutterCarousel.builder(
          options: CarouselOptions(
            height: 224,
            showIndicator: false,
          ),
          itemCount: carouselData.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            final item = carouselData[itemIndex];
            return CustomCarouselItem(
              pageViewIndex: pageViewIndex,
              title: item['title']!,
              subtitle: item['subtitle']!,
              imagePath: item['imagePath']!,
              footerText: item['footerText']!,
            );
          },
        )
      ],
    );
  }
}
