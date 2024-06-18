import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';

class RecommendationSearchRecycleWidget extends StatelessWidget {
  const RecommendationSearchRecycleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> recommendationList = [
      'Cara Daur Ulang Kertas',
      'Sampah Organik',
      'Recycle',
      'Memilah Sampah',
      'Trash',
      'Tips Daur Ulang Sampah',
      'Recycle Thing'
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paling Banyak Dicari',
            style: TextStyleConstant.boldSubtitle.copyWith(
              color: ColorConstant.netralColor900,
            ),
          ),
          SpacingConstant.verticalSpacing150,
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: recommendationList
                  .map((label) => _itemContainer(label),)
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemContainer(String label) {
    final RecycleController controller = Get.find();
    return GestureDetector(
      onTap: () {
        controller.searchByRecommendation(label);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: const BoxDecoration(
          color: ColorConstant.primaryColor500,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: TextStyleConstant.semiboldParagraph.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
