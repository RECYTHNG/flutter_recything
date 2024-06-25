import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/user_controller.dart';
import 'package:recything_application/screens/edit_profile/gender_pick/gender_pick_screen.dart';
import 'package:recything_application/screens/edit_profile/success/success_screen.dart';
import 'package:recything_application/screens/edit_profile/widget/date_picker_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  final UserController controller = Get.put(UserController());

  final _formKey = GlobalKey<FormState>();

  Future<void> _loadImage(String url) async {
    if (url.isEmpty) {
      return;
    }

    final ImageStream imageStream =
        NetworkImage(url).resolve(const ImageConfiguration());
    final Completer<void> completer = Completer<void>();

    imageStream.addListener(
      ImageStreamListener((_, __) {
        completer.complete();
      }),
    );

    return completer.future;
  }

  Future<void> _loadAllData() async {
    final data = controller.userModel.value.data;
    if (data?.pictureUrl != null && data!.pictureUrl!.isNotEmpty) {
      await _loadImage(data.pictureUrl!);
    }
    if (data?.badge != null && data!.badge!.isNotEmpty) {
      await _loadImage(data.badge!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profil',
          style: TextStyleConstant.boldSubtitle.copyWith(
            color: ColorConstant.whiteColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorConstant.netralColor50,
            size: 20,
          ),
        ),
        backgroundColor: ColorConstant.primaryColor500,
      ),
      body: Obx(
        () {
          final data = controller.userModel.value.data;

          if (data == null) {
            return const Center(
              child: MyLoading(),
            );
          }
          return FutureBuilder(
            future: _loadAllData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: MyLoading(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error loading data'),
                );
              } else {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              ImageConstant.backgroundImage,
                            ),
                            Positioned(
                              bottom: -50,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  CircleAvatar(
                                    radius: 64,
                                    backgroundColor: data.pictureUrl == null ||
                                            data.pictureUrl!.isEmpty
                                        ? ColorConstant.blackColor10
                                        : Colors.transparent,
                                    child: data.pictureUrl == null ||
                                            data.pictureUrl!.isEmpty
                                        ? const Icon(
                                            Icons.person,
                                            color: Color(0xFF666666),
                                            size: 48,
                                          )
                                        : Container(
                                            width: 128,
                                            height: 128,
                                            decoration: BoxDecoration(
                                              color: ColorConstant.whiteColor,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    data.pictureUrl!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                  ),
                                  if (data.badge != null &&
                                      data.badge!.isNotEmpty)
                                    Positioned(
                                      bottom: -20,
                                      child: Image.network(
                                        data.badge!,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SpacingConstant.verticalSpacing1000,
                        GestureDetector(
                          onTap: () => controller
                              .showImageSourceDialog(controller.pickImage),
                          child: const Text(
                            'Ubah Foto Profil',
                            style: TextStyle(
                              color: ColorConstant.primaryColor500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SpacingConstant.verticalSpacing400,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              CustomTextFieldWidget(
                                label: 'Nama Lengkap',
                                hint: 'Nama Lengkap',
                                controller: TextEditingController(
                                  text: controller.name.value,
                                ),
                                onChanged: (value) {
                                  controller.name.value = value;
                                },
                              ),
                              SpacingConstant.verticalSpacing200,
                              CustomTextFieldWidget(
                                label: 'Jenis Kelamin',
                                hint: 'Pilih Jenis Kelamin',
                                isForm: false,
                                targetScreen: const GenderPickScreen(),
                                controller: TextEditingController(
                                  text: controller.gender.value,
                                ),
                              ),
                              SpacingConstant.verticalSpacing200,
                              DatePickerWidget(
                                label: 'Tanggal Lahir',
                                hint: 'Input Tanggal Lahir',
                                controller: TextEditingController(
                                  text: controller.birthDate.value,
                                ),
                                onChanged: (value) {
                                  controller.birthDate.value = value;
                                },
                              ),
                              SpacingConstant.verticalSpacing200,
                              CustomTextFieldWidget(
                                label: 'Email',
                                hint: 'Email',
                                controller: TextEditingController(
                                  text: controller.email.value,
                                ),
                                onChanged: (value) {
                                  controller.email.value = value;
                                },
                              ),
                              SpacingConstant.verticalSpacing200,
                              CustomTextFieldWidget(
                                label: 'Alamat',
                                hint: 'Isi Alamat',
                                isTextArea: true,
                                controller: TextEditingController(
                                  text: controller.address.value,
                                ),
                                onChanged: (value) {
                                  controller.address.value = value;
                                },
                              ),
                              SpacingConstant.verticalSpacing200,
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    controller.updateUserProfile(() {
                                      Get.to(() => const SuccessScreen());
                                    });
                                  }
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor500,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Simpan',
                                    style: TextStyleConstant.semiboldSubtitle
                                        .copyWith(
                                      color: ColorConstant.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              SpacingConstant.verticalSpacing200,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
