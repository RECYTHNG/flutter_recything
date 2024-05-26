import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_button_widget.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class RegisterAuthenticationScreen extends StatefulWidget {
  const RegisterAuthenticationScreen({super.key});

  @override
  State<RegisterAuthenticationScreen> createState() =>
      _RegisterAuthenticationScreenState();
}

class _RegisterAuthenticationScreenState
    extends State<RegisterAuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _name = '';
  String _email = '';
  String _phone = '';
  String _password = '';

  String? _errorName;
  String? _errorEmail;
  String? _errorPhone;
  String? _errorPassword;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _resetVariable() {
    _name = '';
    _email = '';
    _phone = '';
    _password = '';
    _errorName = null;
    _errorEmail = null;
    _errorPhone = null;
    _errorPassword = null;
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.netralColor50,
      body: SingleChildScrollView(
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
                  CustomTextFieldWidget(
                    key: _formKey,
                    label: 'Nama',
                    hint: 'Masukkan Nama Lengkap',
                    hintTextColor: const Color(0xFFCBCBCB),
                    onChanged: (String value) {
                      _name = value;
                      if (_name.isEmpty) {
                        _errorName = 'Nama harus diisi oleh user.';
                      } else if (RegExp(r'[0-9!@#%^&*(),.?":{}|<>]')
                          .hasMatch(value)) {
                        _errorName =
                            'Nama tidak boleh mengandung angka atau karakter spesial.';
                      } else {
                        _errorName = null;
                      }
                      setState(() {});
                    },
                    error: _errorName,
                  ),
                  SpacingConstant.verticalSpacing200,
                  CustomTextFieldWidget(
                    key: _formKey,
                    label: 'Email',
                    hint: 'Masukkan Email',
                    hintTextColor: const Color(0xFFCBCBCB),
                    onChanged: (String value) {
                      _email = value;
                      if (_email.isEmpty) {
                        _errorEmail = 'Email harus harus diisi.';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        _errorEmail = 'Email tidak valid.';
                      } else {
                        _errorEmail = null;
                      }
                      setState(() {});
                    },
                    error: _errorEmail,
                  ),
                  SpacingConstant.verticalSpacing200,
                  CustomTextFieldWidget(
                    key: _formKey,
                    label: 'Nomor Handphone',
                    hint: 'Masukkan Nomor Handphone',
                    hintTextColor: const Color(0xFFCBCBCB),
                    isInputForPhone: true,
                    onChanged: (String value) {
                      _phone = value;
                      if (_phone.isEmpty) {
                        _errorPhone = 'Nomor Handphone harus diisi.';
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        _errorPhone = 'Nomor Handphone tidak valid.';
                      } else {
                        _errorPhone = null;
                      }
                      setState(() {});
                    },
                    error: _errorPhone,
                  ),
                  SpacingConstant.verticalSpacing200,
                  CustomTextFieldWidget(
                    key: _formKey,
                    label: 'Password',
                    hint: 'Masukkan Password',
                    hintTextColor: const Color(0xFFCBCBCB),
                    onChanged: (String value) {
                      _password = value;
                      if (_password.isEmpty) {
                        _errorPassword = 'Password harus diisi.';
                      } else if (_password.length < 8) {
                        _errorPassword = 'Password minimal 8 karakter.';
                      } else {
                        _errorPassword = null;
                      }
                      setState(() {});
                    },
                    error: _errorPassword,
                  ),
                  SpacingConstant.verticalSpacing400,
                  GlobalButtonWidget(
                    onTap: () {},
                    width: double.infinity,
                    height: 40.0,
                    backgroundColor: ColorConstant.primaryColor500,
                    isBorder: false,
                    title: 'Register',
                    textColor: ColorConstant.whiteColor,
                    fontSize: 16.0,
                  ),
                  SpacingConstant.verticalSpacing400,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah Punya Akun? ',
                        style: TextStyleConstant.regularSubtitle
                            .copyWith(color: ColorConstant.netralColor600),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Login',
                          style: TextStyleConstant.regularSubtitle
                              .copyWith(color: ColorConstant.primaryColor500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
