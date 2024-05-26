import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/splash/splash_screen.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

import 'widgets/container_number_otp_widget.dart';

class OneTimePasswordAuthenticationScreen extends StatefulWidget {
  const OneTimePasswordAuthenticationScreen({super.key});

  @override
  State<OneTimePasswordAuthenticationScreen> createState() =>
      _OneTimePasswordAuthenticationScreenState();
}

class _OneTimePasswordAuthenticationScreenState
    extends State<OneTimePasswordAuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.netralColor50,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorConstant.netralColor50,
        ),
        backgroundColor: ColorConstant.primaryColor500,
        title: Text(
          'Verifikasi OTP',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.netralColor50,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masukkan kode OTP',
              style: TextStyleConstant.semiboldHeading4,
            ),
            SpacingConstant.verticalSpacing200,
            Text(
              'Kami sudah mengirimkan kode OTP pada email di bawah ini',
              style: TextStyleConstant.regularCaption,
            ),
            SpacingConstant.verticalSpacing400,
            Text(
              'Email',
              style: TextStyleConstant.semiboldParagraph,
            ),
            SpacingConstant.verticalSpacing400,
            Text(
              'Masukkan kode OTP yang kamu terima di sini',
              style: TextStyleConstant.regularCaption,
            ),
            SpacingConstant.verticalSpacing200,
            Form(
              key: _formKey,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerNumberOTPWidget(),
                  ContainerNumberOTPWidget(),
                  ContainerNumberOTPWidget(),
                  ContainerNumberOTPWidget(),
                  ContainerNumberOTPWidget(),
                  ContainerNumberOTPWidget(),
                ],
              ),
            ),
            const Spacer(),
            GlobalButtonWidget(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
              width: double.infinity,
              height: 40.0,
              backgroundColor: ColorConstant.primaryColor500,
              isBorder: false,
              title: 'Selesai',
              textColor: ColorConstant.whiteColor,
              fontSize: 16.0,
            ),
            SpacingConstant.verticalSpacing800,
          ],
        ),
      ),
    );
  }
}
