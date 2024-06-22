import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/login_controller.dart';
import 'package:recything_application/screens/authentication/register/register_screen.dart';
import 'package:recything_application/screens/authentication/login/widgets/login_button_widget.dart';
import 'package:recything_application/screens/authentication/login/widgets/login_form_email_widget.dart';
import 'package:recything_application/screens/authentication/login/widgets/login_form_password_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class LoginAuthenticationScreen extends StatelessWidget {
  LoginAuthenticationScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.netralColor50,
      body: Obx(() => Stack(
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
                            'Masuk Akun',
                            style: TextStyleConstant.semiboldHeading4,
                          ),
                          Text(
                            'Mari bersama-sama terus berkontribusi! Segera masuk ke akun Anda',
                            style: TextStyleConstant.regularParagraph,
                            textAlign: TextAlign.justify,
                          ),
                          SpacingConstant.verticalSpacing300,
                          Form(
                            key: loginController.formKey,
                            child: Column(
                              children: [
                                LoginFormEmailWidget(
                                    loginController: loginController),
                                SpacingConstant.verticalSpacing200,
                                LoginFormPasswordWidget(
                                  loginController: loginController,
                                ),
                              ],
                            ),
                          ),
                          SpacingConstant.verticalSpacing400,
                          LoginButtonWidget(loginController: loginController),
                          SpacingConstant.verticalSpacing300,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tidak Punya Akun? ',
                                style:
                                    TextStyleConstant.regularSubtitle.copyWith(
                                  color: ColorConstant.netralColor600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.off(() => RegisterAuthenticationScreen());
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyleConstant.regularSubtitle
                                      .copyWith(
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
              if (loginController.isLoading.value)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: MyLoading(),
                  ),
                ),
            ],
          )),
    );
  }
}
