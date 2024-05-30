import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/challenge_dashboard/widgets/my_challenge/progress_bar_challenge_widget.dart';

class ItemMyChallengeWidget extends StatelessWidget {
  const ItemMyChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 328,
      // height: 230,
      decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff64646F).withOpacity(0.2),
              offset: const Offset(0, 7),
              blurRadius: 29,
            ),
          ]),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 160,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: Image.asset(
                    ImageConstant.exampleItemMyChallenge,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9).withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Daur Ulang Kreatif',
                        style: TextStyleConstant.semiboldParagraph,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 34,
                bottom: 24,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: const BoxDecoration(
                    color: ColorConstant.primaryColor500,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Status',
                      style: TextStyleConstant.semiboldCaption.copyWith(
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const ProgressBarChallengeWidget(progress: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '3 dari 6 aksi',
                      style: TextStyleConstant.regularCaption,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
