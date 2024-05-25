import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class GenderPickScreen extends StatefulWidget {
  const GenderPickScreen({super.key});

  @override
  State<GenderPickScreen> createState() => _GenderPickScreenState();
}

class _GenderPickScreenState extends State<GenderPickScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pilih Jenis Kelamin',
          style: TextStyle(
            fontSize: 24,
            color: ColorConstant.netralColor50,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorConstant.netralColor50,
          ),
        ),
        backgroundColor: ColorConstant.primaryColor500,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SpacingConstant.verticalSpacing400,
                Text(
                  'Pilih Jenis Kelamin',
                  style: TextStyleConstant.semiboldHeading3,
                ),
                SpacingConstant.verticalSpacing400,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstant.maleEditProfil,
                      scale: 0.8,
                    ),
                    SpacingConstant.horizontalSpacing500,
                    Image.asset(
                      ImageConstant.femaleEditProfil,
                      scale: 0.8,
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 56, right: 24, left: 24),
              child: TextButton(
                onPressed: () => {},
                child: Container(
                  color: ColorConstant.primaryColor500,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Simpan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
