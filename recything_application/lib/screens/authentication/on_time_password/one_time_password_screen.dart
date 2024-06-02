// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/otp_controller.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

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
  final OtpController otpController = Get.put(
    OtpController(),
  );

  @override
  void initState() {
    super.initState();
    otpController.setEmail(widget.email);
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
              key: otpController.formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) {
                    return Obx(
                      () => SizedBox(
                        height: 50.0,
                        width: 46.0,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          controller: otpController.otpControllers[index],
                          style: TextStyleConstant.semiboldTitle,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          cursorColor: ColorConstant.primaryColor500,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText: '-',
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: ColorConstant.netralColor600,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: ColorConstant.primaryColor500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SpacingConstant.verticalSpacing400,
            GestureDetector(
              onTap: () {
                otpController.resendOtp();
              },
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
                otpController.submitOtp();
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
