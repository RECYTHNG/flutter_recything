import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/authentication/login/login_screen.dart';
import 'package:recything_application/screens/authentication/register/register_screen.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor50,
      body: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 465.0,
              decoration: const BoxDecoration(
                color: ColorConstant.primaryColor500,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(125.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 465.0,
            right: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorConstant.primaryColor500,
              ),
              child: Container(
                width: 50.0,
                height: 20.0,
                decoration: const BoxDecoration(
                  color: ColorConstant.primaryColor50,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(60, 30),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SpacingConstant.verticalSpacing200,
                SpacingConstant.verticalSpacing200,
                Image.asset(
                  ImageConstant.logo,
                  width: 165.0,
                  height: 30.0,
                ),
                SpacingConstant.verticalSpacing600,
                Image.asset(
                  ImageConstant.welcomeImage,
                  width: 300.0,
                  height: 300.0,
                ),
                SpacingConstant.verticalSpacing200,
                Text(
                  'Ayo mulai Aksi Nyata peduli \nlingkungan!',
                  style: TextStyleConstant.semiboldHeading4.copyWith(
                    color: ColorConstant.netralColor50,
                  ),
                  textAlign: TextAlign.center,
                ),
                SpacingConstant.verticalSpacing200,
                Text(
                  'Sebelum memulai petualanganmu sebagai pahlawan Recything, mari masuk atau daftarkan akunmu terlebih dahulu.',
                  style: TextStyleConstant.regularSubtitle.copyWith(
                    color: ColorConstant.netralColor50,
                  ),
                  textAlign: TextAlign.center,
                ),
                SpacingConstant.verticalSpacing800,
                GlobalButtonWidget(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            const RegisterAuthenticationScreen(),
                      ),
                    );
                  },
                  width: double.infinity,
                  height: 40.0,
                  backgroundColor: ColorConstant.whiteColor,
                  isBorder: false,
                  title: 'Register',
                  textColor: ColorConstant.primaryColor500,
                  fontSize: 16.0,
                ),
                SpacingConstant.verticalSpacing200,
                GlobalButtonWidget(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginAuthenticationScreen(),
                      ),
                    );
                  },
                  width: double.infinity,
                  height: 40.0,
                  backgroundColor: ColorConstant.whiteColor,
                  isBorder: false,
                  title: 'Login',
                  textColor: ColorConstant.primaryColor500,
                  fontSize: 16.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
