import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/register_controller.dart';
import 'package:recything_application/screens/authentication/login/login_screen.dart';
import 'package:recything_application/screens/authentication/register/widgets/register_button_widget.dart';
import 'package:recything_application/screens/authentication/register/widgets/register_form_email_widget.dart';
import 'package:recything_application/screens/authentication/register/widgets/register_form_name_widget.dart';
import 'package:recything_application/screens/authentication/register/widgets/register_form_password_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class RegisterAuthenticationScreen extends StatelessWidget {
  RegisterAuthenticationScreen({super.key});

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.netralColor50,
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
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
                        Form(
                          key: registerController.formKey,
                          child: Column(
                            children: [
                              RegisterFormNameWidget(
                                registerController: registerController,
                              ),
                              SpacingConstant.verticalSpacing200,
                              RegisterFormEmailWidget(
                                registerController: registerController,
                              ),
                              SpacingConstant.verticalSpacing200,
                              RegisterFormPasswordWidget(
                                registerController: registerController,
                              ),
                            ],
                          ),
                        ),
                        SpacingConstant.verticalSpacing400,
                        RegisterButtonWidget(
                          registerController: registerController,
                        ),
                        SpacingConstant.verticalSpacing300,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah Punya Akun? ',
                              style: TextStyleConstant.regularSubtitle.copyWith(
                                color: ColorConstant.netralColor600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.off(() => LoginAuthenticationScreen());
                              },
                              child: Text(
                                'Login',
                                style:
                                    TextStyleConstant.regularSubtitle.copyWith(
                                  color: ColorConstant.primaryColor500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SpacingConstant.verticalSpacing200,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (registerController.isLoading.value)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: MyLoading(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
