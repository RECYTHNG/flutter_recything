import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/screens/edit_profile/content/gender_pick/gender_pick_screen.dart';
import 'package:recything_application/screens/edit_profile/content/photo_pick/photo_pick_screen.dart';
import 'package:recything_application/screens/edit_profile/widget/date_picker_widget.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpacingConstant.verticalSpacing800,
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
                      ImageConstant.medalEditProfil,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              SpacingConstant.verticalSpacing250,
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoPickerScreen(),
                  ),
                ),
                child: const Text(
                  'Ubah Foto Profil',
                  style: TextStyle(
                    color: ColorConstant.primaryColor500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SpacingConstant.verticalSpacing200,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const CustomTextFieldWidget(
                      label: 'Nama Lengkap',
                      hint: 'Nama Lengkap',
                    ),
                    SpacingConstant.verticalSpacing200,
                    const CustomTextFieldWidget(
                      label: 'Jenis Kelamin',
                      hint: 'Pilih Jenis Kelamin',
                      isForm: false,
                      targetScreen: GenderPickScreen(),
                    ),
                    SpacingConstant.verticalSpacing200,
                    const DatePickerWidget(
                      label: 'Tanggal Lahir',
                      hint: 'Input Tanggal Lahir',
                    ),
                    SpacingConstant.verticalSpacing200,
                    const CustomTextFieldWidget(
                      label: 'Email',
                      hint: 'Email',
                    ),
                    SpacingConstant.verticalSpacing200,
                    const CustomTextFieldWidget(
                      label: 'Nomor Handphone',
                      hint: 'Nomor Handphone',
                      isInputForPhone: true,
                    ),
                    SpacingConstant.verticalSpacing200,
                    const CustomTextFieldWidget(
                      label: 'Alamat',
                      hint: 'Isi Alamat',
                      isTextArea: true,
                    ),
                    SpacingConstant.verticalSpacing200,
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.grey;
                            }
                            return ColorConstant.primaryColor500;
                          },
                        ),
                        padding:
                            WidgetStateProperty.all(const EdgeInsets.all(8)),
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
          ),
        ),
      ),
    );
  }
}
