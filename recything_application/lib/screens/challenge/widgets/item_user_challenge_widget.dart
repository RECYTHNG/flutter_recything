import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/challenge/widgets/stepper/five_stepper_widget.dart';
import 'package:recything_application/screens/challenge/widgets/stepper/four_stepper_widget.dart';
import 'package:recything_application/screens/challenge/widgets/stepper/three_stepper_widget.dart';
import 'package:recything_application/screens/challenge/widgets/stepper/two_stepper_widget.dart';

class ItemUserChallengeWidget extends StatelessWidget {
  final String title;
  final String status;
  final int totalStep;
  final String image;
  const ItemUserChallengeWidget({
    super.key,
    required this.title,
    required this.status,
    required this.totalStep,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 264,
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
        ],
      ),
      padding: const EdgeInsets.all(10),
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
                  child: Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 110,
                  ),
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9).withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyleConstant.semiboldParagraph.copyWith(
                            color: ColorConstant.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20,
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
                      status,
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
                SpacingConstant.verticalSpacing200,
                if (totalStep == 2)
                  const TwoStepperWidget()
                else if (totalStep == 3)
                  const ThreeStepperWidget()
                else if (totalStep == 4)
                  const FourStepperWidget()
                else
                  const FiveStepperWidget(),
                SpacingConstant.verticalSpacing200,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Instruksi',
                      style: TextStyleConstant.regularFooter,
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
