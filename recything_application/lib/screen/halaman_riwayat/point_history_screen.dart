import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class PointHisstoryScreen extends StatefulWidget {
  const PointHisstoryScreen({super.key});

  @override
  State<PointHisstoryScreen> createState() => _PointHisstoryScreenState();
}

class _PointHisstoryScreenState extends State<PointHisstoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor50,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorConstant.netralColor50),
        backgroundColor: ColorConstant.primaryColor500,
        title: Text(
          'Riwayat Poin',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor50,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 130.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF00466D),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.goldBagdesImage,
                  height: 24.0,
                ),
                SpacingConstant.horizontalSpacing100,
                Row(
                  children: [
                    Text(
                      '3000',
                      style: TextStyleConstant.semiboldHeading4.copyWith(
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                    SpacingConstant.horizontalSpacing100,
                    Text(
                      'Poin',
                      style: TextStyleConstant.regularParagraph.copyWith(
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SpacingConstant.verticalSpacing100,
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    height: 75.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: ColorConstant.blackColor.withOpacity(0.1),
                          blurRadius: 8.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Menyelesaikan Chalenge',
                                style:
                                    TextStyleConstant.semiboldSubtitle.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                              Text(
                                ' +1000',
                                style:
                                    TextStyleConstant.semiboldSubtitle.copyWith(
                                  color: ColorConstant.netralColor900,
                                ),
                              ),
                            ],
                          ),
                          SpacingConstant.verticalSpacing100,
                          Text(
                            '18 Desember 2002',
                            style: TextStyleConstant.regularCaption.copyWith(
                              color: ColorConstant.netralColor900,
                            ),
                          )
                        ],
                      ),
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
