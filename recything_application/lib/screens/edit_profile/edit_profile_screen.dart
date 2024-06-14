import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/user/user_controller.dart';
import 'package:recything_application/screens/edit_profile/content/gender_pick/gender_pick_screen.dart';
import 'package:recything_application/screens/edit_profile/content/success/success_screen.dart';
import 'package:recything_application/screens/edit_profile/widget/date_picker_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  final UserController controller = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    setState(() {
      _isLoading = true;
    });
    try {
      controller.uploadAvatar(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Avatar updated successfully')),
        );
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            fontSize: 24,
            color: ColorConstant.netralColor50,
            fontWeight: FontWeight.w700,
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

          nameController.text = data.name ?? '';
          genderController.text = data.gender ?? '';
          birthDateController.text =
              data.birthDate?.toIso8601String().split('T')[0] ?? '';
          emailController.text = data.email ?? '';
          addressController.text = data.address ?? '';

          return FutureBuilder(
            future: _loadAllData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  _isLoading) {
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
                                    radius: 40,
                                    backgroundColor: Colors.transparent,
                                    child: data.pictureUrl == null ||
                                            data.pictureUrl!.isEmpty
                                        ? const Icon(
                                            Icons.person,
                                            color: Color(0xFF666666),
                                            size: 48,
                                          )
                                        : Container(
                                            width: 80,
                                            height: 80,
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
                                        width: 32,
                                        height: 32,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SpacingConstant.verticalSpacing1000,
                        GestureDetector(
                          onTap: _pickImage,
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
                                controller: nameController,
                              ),
                              SpacingConstant.verticalSpacing200,
                              CustomTextFieldWidget(
                                label: 'Jenis Kelamin',
                                hint: 'Pilih Jenis Kelamin',
                                isForm: false,
                                targetScreen: const GenderPickScreen(),
                                controller: genderController,
                              ),
                              SpacingConstant.verticalSpacing200,
                              DatePickerWidget(
                                label: 'Tanggal Lahir',
                                hint: 'Input Tanggal Lahir',
                                controller: birthDateController,
                              ),
                              SpacingConstant.verticalSpacing200,
                              CustomTextFieldWidget(
                                label: 'Email',
                                hint: 'Email',
                                controller: emailController,
                              ),
                              SpacingConstant.verticalSpacing200,
                              CustomTextFieldWidget(
                                label: 'Alamat',
                                hint: 'Isi Alamat',
                                isTextArea: true,
                                controller: addressController,
                              ),
                              SpacingConstant.verticalSpacing200,
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    final updatedData = {
                                      'name': nameController.text,
                                      'email': emailController.text,
                                      'address': addressController.text,
                                      'gender': genderController.text,
                                      'birth_date': birthDateController.text,
                                    };
                                    FocusScope.of(context).unfocus();
                                    controller.updateUserProfile(updatedData,
                                        () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SuccessScreen()),
                                      );
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
                                  child: const Text(
                                    'Simpan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
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
