import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/map_rubbish_controller.dart';

class MaterialDetailsReportRubbishWidget extends StatelessWidget {
  const MaterialDetailsReportRubbishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapRubbishController controller = Get.put(MapRubbishController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tipe Sampah',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor900,
          ),
          textAlign: TextAlign.left,
        ),
        SpacingConstant.verticalSpacing150,
        Row(
          children: [
            Expanded(
              child: Obx(
                () {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 6,
                    children: controller.materialData.keys.map((key) {
                      final isSelected = controller.materialData[key]!;
                      return materialItemContainer(
                        name: key,
                        isSelected: isSelected,
                        onTap: () {
                          controller.materialData[key] = !isSelected;
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget materialItemContainer({
    required String name,
    required bool isSelected,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorConstant.primaryColor500
              : const Color(0XFF9F9F9F),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Text(
          name,
          style: TextStyleConstant.semiboldButton.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
