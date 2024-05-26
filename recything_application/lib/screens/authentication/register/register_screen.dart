import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_button_widget.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class RegisterAuthenticationScreen extends StatefulWidget {
  const RegisterAuthenticationScreen({super.key});

  @override
  State<RegisterAuthenticationScreen> createState() =>
      _RegisterAuthenticationScreenState();
}

class _RegisterAuthenticationScreenState
    extends State<RegisterAuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.netralColor50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              ImageConstant.authImage,
              width: MediaQuery.of(context).size.width,
            ),
            SpacingConstant.verticalSpacing300,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      ImageConstant.logo,
                      width: 165.0,
                      height: 30.0,
                    ),
                  ),
                  SpacingConstant.verticalSpacing300,
                  Text(
                    'Daftar Akun',
                    style: TextStyleConstant.semiboldHeading4,
                  ),
                  Text(
                    'Bersiaplah Untuk Menjadi Pahlawan Lingkungan! Daftarkan Akunmu Sekarang',
                    style: TextStyleConstant.regularParagraph,
                    textAlign: TextAlign.justify,
                  ),
                  SpacingConstant.verticalSpacing300,
                  CustomTextFieldWidget(
                    label: 'Nama',
                    hint: 'Masukkan Nama Lengkap',
                    onChanged: (value) {},
                  ),
                  SpacingConstant.verticalSpacing200,
                  CustomTextFieldWidget(
                    label: 'Email',
                    hint: 'Masukkan Email',
                    onChanged: (value) {},
                  ),
                  SpacingConstant.verticalSpacing200,
                  CustomTextFieldWidget(
                    label: 'Nomor Handphone',
                    hint: 'Masukkan Nomor Handphone',
                    isInputForPhone: true,
                    onChanged: (value) {},
                  ),
                  SpacingConstant.verticalSpacing200,
                  CustomTextFieldWidget(
                    label: 'Password',
                    hint: 'Masukkan Password',
                    onChanged: (value) {},
                  ),
                  SpacingConstant.verticalSpacing400,
                  GlobalButtonWidget(
                    onTap: () {},
                    width: double.infinity,
                    height: 40.0,
                    backgroundColor: ColorConstant.primaryColor500,
                    isBorder: false,
                    title: 'Register',
                    textColor: ColorConstant.whiteColor,
                    fontSize: 16.0,
                  ),
                  SpacingConstant.verticalSpacing400,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah Punya Akun? ',
                        style: TextStyleConstant.regularSubtitle
                            .copyWith(color: ColorConstant.netralColor600),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Login',
                          style: TextStyleConstant.regularSubtitle
                              .copyWith(color: ColorConstant.primaryColor500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
