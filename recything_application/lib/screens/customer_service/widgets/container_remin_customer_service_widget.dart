import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/chatbot/remin_chatbot_screen.dart';

class ReMinCustomerServiceWidget extends StatelessWidget {
  const ReMinCustomerServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReMinChatbotScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 70.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstant.netralColor50,
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
            horizontal: 16.0,
            vertical: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masih butuh bantuan?',
                    style: TextStyleConstant.regularCaption.copyWith(
                      fontSize: 12.0,
                      color: ColorConstant.netralColor900,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SpacingConstant.verticalSpacing100,
                  Text(
                    'Mulai chat ReMin sekarang!',
                    style: TextStyleConstant.regularCaption.copyWith(
                      fontSize: 12.0,
                      color: ColorConstant.netralColor900,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Image.asset(
                ImageConstant.reminCutomerService,
                height: 40.0,
                width: 40.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
