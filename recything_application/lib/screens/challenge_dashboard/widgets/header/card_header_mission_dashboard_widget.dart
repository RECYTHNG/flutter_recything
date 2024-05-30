import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class CardHeaderMissionDashboardWidget extends StatelessWidget {
  const CardHeaderMissionDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 160,
        right: 17,
        left: 17,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 23,
        horizontal: 18,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorConstant.primaryColor400,
        borderRadius: BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Poin',
                style: TextStyleConstant.semiboldCaption.copyWith(
                  color: ColorConstant.netralColor50,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 17,
                ),
                height: 29,
                decoration: BoxDecoration(
                  color: const Color(0xffEFEFEF),
                  border: Border.all(
                    width: 1,
                    color: ColorConstant.primaryColor500,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(11),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/mission_dashboard/gold_medal.png',
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'GOLD',
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '200.000',
                style: TextStyleConstant.semiboldHeading3.copyWith(
                  color: ColorConstant.netralColor50,
                ),
              )
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 30,
                    ),
                    decoration: const BoxDecoration(
                      color: ColorConstant.primaryColor500,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Tambah Poin',
                        style: TextStyleConstant.semiboldParagraph.copyWith(
                          color: ColorConstant.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Riwayat',
                        style: TextStyleConstant.semiboldParagraph.copyWith(
                          color: ColorConstant.primaryColor500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
