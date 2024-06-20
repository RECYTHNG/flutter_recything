import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/user_controller.dart';

class GenderPickScreen extends StatefulWidget {
  const GenderPickScreen({super.key});

  @override
  State<GenderPickScreen> createState() => _GenderPickScreenState();
}

class _GenderPickScreenState extends State<GenderPickScreen> {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
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
      body: Obx(
        () {
          String selectedGender =
              userController.gender.value.capitalizeFirst ?? '';
          return Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SpacingConstant.horizontalSpacing500,
                        GestureDetector(
                          onTap: () => userController.updateGender('Laki-laki'),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  SvgPicture.asset(
                                    IconConstant.iconMale,
                                    colorFilter: selectedGender == 'Laki-laki'
                                        ? const ColorFilter.mode(
                                            ColorConstant.primaryColor500,
                                            BlendMode.srcIn)
                                        : null,
                                  ),
                                  if (selectedGender == 'Laki-laki')
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.white,
                                      ),
                                      child: const Icon(
                                        size: 22,
                                        Icons.check_circle_rounded,
                                        color: ColorConstant.primaryColor500,
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Laki-laki',
                                style: TextStyle(
                                  color: selectedGender == 'Laki-laki'
                                      ? ColorConstant.primaryColor500
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => userController.updateGender('Perempuan'),
                          child: Column(
                            children: [
                              selectedGender != 'Perempuan'
                                  ? SvgPicture.asset(
                                      IconConstant.iconFemale,
                                    )
                                  : SvgPicture.asset(
                                      IconConstant.iconFemaleActive,
                                    ),
                              const SizedBox(height: 8),
                              Text(
                                'Perempuan',
                                style: TextStyle(
                                  color: selectedGender == 'Perempuan'
                                      ? ColorConstant.primaryColor500
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpacingConstant.horizontalSpacing500,
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 56, right: 24, left: 24),
                  child: GestureDetector(
                    onTap: selectedGender == ''
                        ? null
                        : () {
                            try {
                              userController.userModel.update((user) {
                                user?.data =
                                    user.data?.copyWith(gender: selectedGender);
                              });
                              Get.back();
                            } catch (e) {
                              print('Error in onTap: $e');
                            }
                          },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selectedGender == ''
                            ? Colors.grey.shade300
                            : ColorConstant.primaryColor500,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedGender == ''
                              ? Colors.grey
                              : ColorConstant.primaryColor500,
                        ),
                      ),
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                          color: selectedGender == ''
                              ? Colors.grey.shade600
                              : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
