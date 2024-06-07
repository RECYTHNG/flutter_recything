import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/user/user_controller.dart';
import 'package:recything_application/screens/edit_profile/content/gender_pick/gender_pick_screen.dart';
import 'package:recything_application/screens/edit_profile/content/photo_pick/photo_pick_screen.dart';
import 'package:recything_application/screens/edit_profile/widget/date_picker_widget.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final UserController controller = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: ColorConstant.netralColor50,
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
                    data.birthDate?.toIso8601String() ?? '';
                emailController.text = data.email ?? '';
                phoneController.text = data.phoneNumber ?? '';
                addressController.text = data.address ?? '';
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Stack(
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
                        child: Image.asset(
                          'assets/images/edit_profile_images/medal.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomTextFieldWidget(
                          label: 'Nama Lengkap',
                          hint: 'Nama Lengkap',
                          controller: nameController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFieldWidget(
                          label: 'Jenis Kelamin',
                          hint: 'Pilih Jenis Kelamin',
                          isForm: false,
                          targetScreen: const GenderPickScreen(),
                          controller: genderController,
                        ),
                        const SizedBox(height: 20),
                        DatePickerWidget(
                          label: 'Tanggal Lahir',
                          hint: 'Input Tanggal Lahir',
                          controller: birthDateController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFieldWidget(
                          label: 'Email',
                          hint: 'Email',
                          controller: emailController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFieldWidget(
                          label: 'Nomor Handphone',
                          hint: 'Nomor Handphone',
                          isInputForPhone: true,
                          controller: phoneController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFieldWidget(
                          label: 'Alamat',
                          hint: 'Isi Alamat',
                          isTextArea: true,
                          controller: addressController,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.disabled)) {
                                  return Colors.grey;
                                }
                                return ColorConstant.primaryColor500;
                              },
                            ),
                            padding: WidgetStateProperty.all(
                                const EdgeInsets.all(8)),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
