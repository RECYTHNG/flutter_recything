import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ThreeStepperWidget extends StatelessWidget {
  const ThreeStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorConstant.primaryColor500,
                    ),
                    color: ColorConstant.primaryColor500,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
                SpacingConstant.verticalSpacing050,
                Text(
                  'Step 1',
                  style: TextStyleConstant.mediumFooter.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 18,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        decoration: const BoxDecoration(
                          color: ColorConstant.primaryColor500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  bottom: 18,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        decoration: const BoxDecoration(
                          color: ColorConstant.primaryColor500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorConstant.primaryColor500,
                    ),
                    color: ColorConstant.primaryColor500,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
                SpacingConstant.verticalSpacing050,
                Text(
                  'Step 3',
                  style: TextStyleConstant.mediumFooter.copyWith(
                    color: ColorConstant.netralColor900,
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstant.primaryColor500,
                  ),
                  color: ColorConstant.primaryColor500,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    size: 12,
                    color: ColorConstant.whiteColor,
                  ),
                ),
              ),
              SpacingConstant.verticalSpacing050,
              Text(
                'Step 2',
                style: TextStyleConstant.mediumFooter.copyWith(
                  color: ColorConstant.netralColor900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}