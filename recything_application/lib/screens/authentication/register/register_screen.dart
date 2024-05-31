// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/authentication/login/login_screen.dart';
import 'package:recything_application/screens/authentication/on_time_password/one_time_password_screen.dart';
import 'package:recything_application/services/authentication/authentication_service.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _name = '';
  String _email = '';
  String _phone = '';
  String _password = '';

  String? _errorName;
  String? _errorEmail;
  String? _errorPhone;
  String? _errorPassword;

  bool _isObscurePassword = false;

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

  bool validation() {
    return _name != '' &&
        _email != '' &&
        _phone != '' &&
        _password != '' &&
        _name.isNotEmpty &&
        _email.isNotEmpty &&
        _phone.isNotEmpty &&
        _password.isNotEmpty;
  }

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final response = await AuthenticationService().postRegister(
          name: _name,
          email: _email,
          phoneNumber: _phone,
          password: _password,
        );

        if (response.code == 201) {
          _resetVariable();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Success'),
              content: Text(
                response.message ?? 'Registration success!',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            OneTimePasswordAuthenticationScreen(
                          email: _email,
                        ),
                      ),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(response.message ?? 'Unknown error'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFieldWidget(
                          label: 'Nama',
                          hint: 'Masukkan Nama Lengkap',
                          hintTextColor: const Color(0xFFCBCBCB),
                          controller: _nameController,
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
                          label: 'Email',
                          hint: 'Masukkan Email',
                          hintTextColor: const Color(0xFFCBCBCB),
                          controller: _emailController,
                          onChanged: (String value) {
                            _email = value;
                            if (_email.isEmpty) {
                              _errorEmail = 'Email harus harus diisi.';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
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
                          label: 'Nomor Handphone',
                          hint: 'Masukkan Nomor Handphone',
                          hintTextColor: const Color(0xFFCBCBCB),
                          isInputForPhone: true,
                          controller: _phoneController,
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
                          isInputForPassword: true,
                          label: 'Password',
                          hint: 'Masukkan Password',
                          hintTextColor: const Color(0xFFCBCBCB),
                          controller: _passwordController,
                          obscureText: _isObscurePassword ? false : true,
                          suffixIconButton: IconButton(
                            icon: Icon(
                              _isObscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ColorConstant.netralColor600,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscurePassword = !_isObscurePassword;
                              });
                            },
                          ),
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
                      ],
                    ),
                  ),
                  SpacingConstant.verticalSpacing400,
                  GlobalButtonWidget(
                    onTap: () {
                      validation() ? _register() : null;
                    },
                    width: double.infinity,
                    height: 40.0,
                    backgroundColor: ColorConstant.primaryColor500,
                    isBorder: false,
                    title: 'Register',
                    textColor: ColorConstant.whiteColor,
                    fontSize: 16.0,
                  ),
                  SpacingConstant.verticalSpacing300,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah Punya Akun? ',
                        style: TextStyleConstant.regularSubtitle
                            .copyWith(color: ColorConstant.netralColor600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginAuthenticationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyleConstant.regularSubtitle
                              .copyWith(color: ColorConstant.primaryColor500),
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
    );
  }
}
