import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/map_litter_controller.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';
import 'package:recything_application/screens/report_litter/pick_litter_location_screen.dart';
import 'package:recything_application/widgets/global_button_widget.dart';

class PickLitterTypeScreen extends StatefulWidget {
  const PickLitterTypeScreen({super.key});

  @override
  State<PickLitterTypeScreen> createState() => _PickLitterTypeScreenState();
}

class _PickLitterTypeScreenState extends State<PickLitterTypeScreen> {
  List<Map<String, String>> listSampah = [
    {
      'name': 'Organik',
      'desc':
          'Sampah organik adalah jenis sampah yang berasal dari bahan-bahan yang dapat terurai secara alami oleh mikroorganisme, seperti sisa makanan, daun, atau kertas',
      'image': 'organic',
    },
    {
      'name': 'Anorganik',
      'desc':
          'sampah yang tidak mudah terurai oleh alam, seperti plastik, kaca, logam, dan karet.',
      'image': 'anorganic',
    },
    {
      'name': 'Berbahaya',
      'desc':
          'Sampah berbahaya mencakup bahan-bahan yang memiliki potensi bahaya bagi kesehatan dan lingkungan, seperti baterai, obat-obatan, dan bahan kimia beracun.',
      'image': 'danger',
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  final ReportLitterController reportLitterController =
      Get.put(ReportLitterController());
  final MapLitterController mapLitterController =
      Get.put(MapLitterController());

  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        title: Text(
          'Pilih Kategori Sampah',
          style: TextStyleConstant.boldHeading4,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listSampah.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    RadioListTile<String>(
                      activeColor: ColorConstant.primaryColor500,
                      title: Row(
                        children: [
                          Image.asset(
                            'assets/images/report_litter/${listSampah[index]['image']}.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          Text(listSampah[index]['name']!),
                        ],
                      ),
                      value: listSampah[index]['name'] ?? '',
                      groupValue: _selectedType,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedType = value;
                        });
                        reportLitterController.updateLitterType(value!);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(listSampah[index]['desc']!),
                    ),
                    SpacingConstant.verticalSpacing300,
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GlobalButtonWidget(
              onTap: _selectedType == null
                  ? () {}
                  : () {
                      Get.to(const PickLitterLocationScreen());
                    },
              width: double.infinity,
              height: 48,
              backgroundColor: _selectedType == null
                  ? ColorConstant.netralColor300
                  : ColorConstant.primaryColor500,
              isBorder: false,
              title: 'Selanjutnya',
              textColor: ColorConstant.whiteColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
