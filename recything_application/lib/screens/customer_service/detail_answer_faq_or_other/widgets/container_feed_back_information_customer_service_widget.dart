// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/customer_service/detail_answer_faq_or_other/widgets/bottom_sheet_feed_back_customer_service/bottom_sheet_feed_back_customer_service_widget.dart';

class FeedBackInformationCustomerServiceWidget extends StatefulWidget {
  const FeedBackInformationCustomerServiceWidget({
    super.key,
  });

  @override
  State<FeedBackInformationCustomerServiceWidget> createState() =>
      _FeedBackInformationCustomerServiceWidgetState();
}

class _FeedBackInformationCustomerServiceWidgetState
    extends State<FeedBackInformationCustomerServiceWidget> {
  bool isSatisfied = false;
  bool isDissatisfied = false;

  void handleDissatisfied() {
    setState(() {
      isDissatisfied = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSatisfied
            ? ColorConstant.secondaryColor50
            : isDissatisfied
                ? ColorConstant.dangerColor50
                : ColorConstant.primaryColor50,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blackColor.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: isSatisfied
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terimakasih sudah menilai!',
                    style: TextStyleConstant.regularCaption.copyWith(
                      fontSize: 12.0,
                      color: ColorConstant.netralColor900,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SvgPicture.asset(
                    IconConstant.sentimenSatisfiedIcon,
                    color: ColorConstant.successColor600,
                    height: 30.0,
                    width: 30.0,
                  ),
                ],
              )
            : isDissatisfied
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Terimakasih sudah menilai!',
                        style: TextStyleConstant.regularCaption.copyWith(
                          fontSize: 12.0,
                          color: ColorConstant.netralColor900,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SvgPicture.asset(
                        IconConstant.sentimenDissatisfiedIcon,
                        color: ColorConstant.dangerColor700,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Apakah informasi ini membantu?',
                        style: TextStyleConstant.regularCaption.copyWith(
                          fontSize: 12.0,
                          color: ColorConstant.netralColor900,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSatisfied = true;
                              });
                            },
                            child: SvgPicture.asset(
                              IconConstant.sentimenSatisfiedIcon,
                              width: 30.0,
                              height: 30.0,
                              color: ColorConstant.netralColor900,
                            ),
                          ),
                          SpacingConstant.horizontalSpacing150,
                          GestureDetector(
                            onTap: () {
                              dialogBottomSheet(context, handleDissatisfied);
                            },
                            child: SvgPicture.asset(
                              IconConstant.sentimenDissatisfiedIcon,
                              width: 30.0,
                              height: 30.0,
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
