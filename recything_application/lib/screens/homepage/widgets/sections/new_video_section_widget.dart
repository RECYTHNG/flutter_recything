import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class NewVideoSectionWidget extends StatelessWidget {
  final List<Map<String, String>> carouselData;

  const NewVideoSectionWidget({super.key, required this.carouselData});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    'Video Terkini',
                    style: TextStyleConstant.boldSubtitle,
                  ),
                  Text(
                    'Yuk Tonton Video Terkini Disini!',
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
          SizedBox(
            height: 234,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carouselData.length,
              itemBuilder: (context, index) {
                final item = carouselData[index];
                return Container(
                  width: 166,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.asset(item['imagePath']!),
                        ),
                        Text(
                          item['title']!,
                          style: TextStyleConstant.semiboldParagraph,
                        ),
                        Text(
                          item['views']!,
                          style: TextStyleConstant.regularFooter,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
