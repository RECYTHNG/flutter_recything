import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/map_litter_controller.dart';
import 'package:recything_application/screens/report_litter/widget/bottomsheet/confirmation_bottom_sheet.dart';
import 'package:recything_application/screens/report_litter/widget/bottomsheet/edit_photo_bottom_sheet.dart';
import 'package:recything_application/screens/report_litter/widget/bottomsheet/litter_type_bottom_sheet.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';

class ReportLitterScreen extends StatefulWidget {
  const ReportLitterScreen({super.key});

  @override
  State<ReportLitterScreen> createState() => ReportLitterScreenState();
}

class ReportLitterScreenState extends State<ReportLitterScreen> {
  final ReportLitterController litterController = Get.find();
  final MapLitterController mapLitterController = Get.find();

  @override
  void initState() {
    super.initState();
    litterController.collectData(
      mapLitterController.lat.value,
      mapLitterController.long.value,
      mapLitterController.address.value,
      mapLitterController.city.value,
      mapLitterController.province.value,
    );
  }

  Future<void> _pickMedia(bool isImage) async {
    await litterController.pickImage();
  }

  void _showConfirmationSheet() {
    if (litterController.title.value.isEmpty ||
        litterController.condition.value.isEmpty ||
        litterController.imageFiles.isEmpty) {
      Get.snackbar(
        '',
        '',
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(12),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.transparent,
        barBlur: 0.0,
        overlayBlur: 0.0,
        snackPosition: SnackPosition.BOTTOM,
        messageText: AwesomeSnackbarContent(
          title: 'Laporan Belum Lengkap',
          message:
              'Silakan isi form terlebih dahulu dan tambahkan minimal satu foto',
          contentType: ContentType.failure,
        ),
      );
      return;
    }

    showModalBottomSheet(
      backgroundColor: ColorConstant.whiteColor,
      context: context,
      builder: (BuildContext context) {
        return ConfirmationBottomSheet(
          onConfirm: () {
            litterController.sendLitterReport();
          },
          onCancel: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showEditLitterTypeSheet() {
    showModalBottomSheet(
      backgroundColor: ColorConstant.whiteColor,
      context: context,
      builder: (BuildContext context) {
        return LitterTypeBottomSheet();
      },
    );
  }

  void _showEditPhotoBottomSheet(XFile media, int index) {
    showModalBottomSheet(
      backgroundColor: ColorConstant.whiteColor,
      context: context,
      builder: (BuildContext context) {
        return EditPhotoBottomSheet(
          media: media,
          index: index,
          onReplaceImage: () {
            litterController.replaceImage(index);
            Navigator.pop(context);
          },
          onDelete: () {
            setState(() {
              litterController.removeImage(index);
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorConstant.netralColor700,
          ),
        ),
        title: Text(
          'Deskripsi Sampah',
          style: TextStyleConstant.boldHeading4,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.netralColor50,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
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
                              const Icon(
                                Icons.location_pin,
                                color: ColorConstant.primaryColor500,
                              ),
                              SpacingConstant.horizontalSpacing200,
                              Flexible(
                                child: Obx(() => Text(
                                      litterController.address.value,
                                      softWrap: true,
                                      style: TextStyleConstant.regularSubtitle,
                                    )),
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
                                  const Icon(
                                    Icons.recycling,
                                    color: ColorConstant.secondaryColor500,
                                  ),
                                  SpacingConstant.horizontalSpacing100,
                                  Obx(() => Text(
                                        litterController.litterType.value,
                                        style:
                                            TextStyleConstant.regularSubtitle,
                                      )),
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
                                  GestureDetector(
                                    onTap: () => _showEditLitterTypeSheet(),
                                    child: const Icon(
                                      Icons.edit,
                                      color: ColorConstant.netralColor600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SpacingConstant.verticalSpacing400,
                    const Row(
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
                      onChanged: (value) =>
                          litterController.title.value = value,
                    ),
                    SpacingConstant.verticalSpacing200,
                    const Row(
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
                      label:
                          'Contoh : Sampah ini mengganggu lingkungan sekitar',
                      hint: 'Laporan',
                      isFloatingLabel: false,
                      isTextArea: true,
                      onChanged: (value) =>
                          litterController.condition.value = value,
                    ),
                    SpacingConstant.verticalSpacing200,
                    Obx(
                      () => Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          ...litterController.imageFiles
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            XFile? media = entry.value;
                            return GestureDetector(
                              onTap: () =>
                                  _showEditPhotoBottomSheet(media!, index),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.file(
                                  File(media?.path ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                          GestureDetector(
                            onTap: () => _pickMedia(true),
                            child: DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 2,
                              dashPattern: const [4, 4],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(4),
                              child: Container(
                                width: 100,
                                height: 100,
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.add_box_sharp,
                                  color: ColorConstant.primaryColor500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpacingConstant.verticalSpacing200,
                    Text(
                      'Maksimum file : 20 Mb',
                      style: TextStyleConstant.regularSubtitle.copyWith(
                        color: ColorConstant.netralColor600,
                      ),
                    ),
                    SpacingConstant.verticalSpacing200,
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorConstant.primaryColor500,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () => _showConfirmationSheet(),
                child: const Text(
                  'Kirim Laporan',
                  style: TextStyle(
                    color: ColorConstant.netralColor50,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
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
