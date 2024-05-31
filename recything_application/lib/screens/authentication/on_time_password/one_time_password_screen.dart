// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/authentication/login/login_screen.dart';
import 'package:recything_application/services/authentication/authentication_service.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

import 'widgets/container_number_otp_widget.dart';

class OneTimePasswordAuthenticationScreen extends StatefulWidget {
  final String email;
  const OneTimePasswordAuthenticationScreen({
    super.key,
    required this.email,
  });

  @override
  State<OneTimePasswordAuthenticationScreen> createState() =>
      _OneTimePasswordAuthenticationScreenState();
}

class _OneTimePasswordAuthenticationScreenState
    extends State<OneTimePasswordAuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  Future<void> _submitOtp() async {
    if (_formKey.currentState!.validate()) {
      try {
        final otp = _otpControllers
            .map((e) => e.text)
            .reduce((value, element) => value + element);
        final response = await AuthenticationService().postOneTimePassword(
          email: widget.email,
          otp: int.parse(otp),
        );
        if (response.code == 200 || response.code == 201) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Success'),
              content: Text(response.message ?? 'Success'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginAuthenticationScreen(),
                      ),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(response.message ?? 'Error'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

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
              widget.email,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return ContainerNumberOTPWidget(
                      controller: _otpControllers[index]);
                }),
              ),
            ),
            SpacingConstant.verticalSpacing400,
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Kirim ulang',
                    style: TextStyleConstant.semiboldParagraph,
                  ),
                ],
              ),
            ),
            const Spacer(),
            GlobalButtonWidget(
              onTap: () {
                _submitOtp();
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
