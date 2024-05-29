import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class RubbishDescScreen extends StatefulWidget {
  const RubbishDescScreen({super.key});

  @override
  State<RubbishDescScreen> createState() => _RubbishDescScreenState();
}

class _RubbishDescScreenState extends State<RubbishDescScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deskripsi Sampah',
          style: TextStyleConstant.boldHeading4,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstant.netralColor50,
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.netralColor900,
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lokasi Sampah',
                    style: TextStyleConstant.semiboldTitle,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: ColorConstant.primaryColor500,
                      ),
                      SpacingConstant.horizontalSpacing200,
                      Flexible(
                        child: Text(
                          'Cibeureum, Kec. Cimahi Sel., Kota Cimahi, Jawa Barat 40535',
                          softWrap: true,
                          style: TextStyleConstant.regularSubtitle,
                        ),
                      ),
                    ],
                  ),
                  SpacingConstant.verticalSpacing200,
                  Text(
                    'Jenis Sampah',
                    style: TextStyleConstant.semiboldTitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.recycling,
                            color: ColorConstant.secondaryColor500,
                          ),
                          SpacingConstant.horizontalSpacing100,
                          Text(
                            'Organik',
                            style: TextStyleConstant.regularSubtitle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 36,
                            color: ColorConstant.netralColor600,
                          ),
                          SpacingConstant.horizontalSpacing100,
                          Icon(
                            Icons.edit,
                            color: ColorConstant.netralColor600,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SpacingConstant.verticalSpacing400,
            Row(
              children: [
                Text('Judul Laporan'),
                Text(
                  '*',
                  style: TextStyle(
                    color: ColorConstant.dangerColor500,
                  ),
                ),
              ],
            ),
            CustomTextFieldWidget(
              label: 'Judul Laporan',
              hint: 'Contoh: Sampah Pinggir Jalan',
              isFloatingLabel: false,
            ),
            Row(
              children: [
                Text('Deskripsi Laporan'),
                Text(
                  '*',
                  style: TextStyle(
                    color: ColorConstant.dangerColor500,
                  ),
                ),
              ],
            ),
            CustomTextFieldWidget(
              label: 'Contoh : Sampah ini mengganggu lingkungan sekitar',
              hint: 'Laporan',
              isFloatingLabel: false,
              isTextArea: true,
            )
          ],
        ),
      ),
    );
  }
}
