import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class GenderPickScreen extends StatefulWidget {
  const GenderPickScreen({super.key});

  @override
  State<GenderPickScreen> createState() => _GenderPickScreenState();
}

class _GenderPickScreenState extends State<GenderPickScreen> {
  String selectedGender = '';

  void _selectGender(String gender) {
    setState(() {
      if (selectedGender == gender) {
        selectedGender = '';
      } else {
        selectedGender = gender;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      child: GestureDetector(
                        onTap: () => _selectGender('male'),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SvgPicture.asset(
                              IconConstant.iconMale,
                              colorFilter: selectedGender == 'male'
                                  ? const ColorFilter.mode(
                                      ColorConstant.primaryColor500,
                                      BlendMode.srcIn)
                                  : null,
                            ),
                            if (selectedGender == 'male')
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
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
                      ),
                    ),
                    SpacingConstant.horizontalSpacing500,
                    Container(
                      alignment: Alignment.topLeft,
                      width: 120,
                      child: GestureDetector(
                        onTap: () => _selectGender('female'),
                        child: selectedGender != 'female'
                            ? SvgPicture.asset(
                                IconConstant.iconFemale,
                              )
                            : SvgPicture.asset(
                                IconConstant.iconFemaleActive,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 56, right: 24, left: 24),
              child: TextButton(
                onPressed: selectedGender == '' ? null : () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.grey;
                      }
                      return ColorConstant.primaryColor500;
                    },
                  ),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
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
            ),
          ],
        ),
      ),
    );
  }
}
