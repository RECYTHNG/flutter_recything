import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/user/user_controller.dart';
import 'package:recything_application/screens/edit_profile/content/gender_pick/gender_pick_screen.dart';
import 'package:recything_application/screens/edit_profile/content/photo_pick/photo_pick_screen.dart';
import 'package:recything_application/screens/edit_profile/content/success/success_screen.dart';
import 'package:recything_application/screens/edit_profile/widget/date_picker_widget.dart';
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

  @override
  void dispose() {
    nameController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Obx(
            () {
              final data = controller.userModel.value.data;
              if (data != null) {
                nameController.text = data.name ?? '';
                genderController.text = data.gender ?? '';
                birthDateController.text =
                    data.birthDate?.toIso8601String().split('T')[0] ?? '';
                emailController.text = data.email ?? '';
                addressController.text = data.address ?? '';
              }

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                            'assets/images/edit_profile_images/Vector.png'),
                        Positioned(
                          bottom: -50,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              const CircleAvatar(
                                backgroundColor: ColorConstant.blackColor10,
                                radius: 48,
                                child: Icon(
                                  Icons.person,
                                  color: Color(0xFF666666),
                                  size: 48,
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: SvgPicture.asset(
                                  'assets/images/edit_profile_images/${data?.badge}_medal.svg',
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
                      onTap: () => Get.to(const PhotoPickerScreen()),
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
                                controller.updateUserProfile(updatedData, () {
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
