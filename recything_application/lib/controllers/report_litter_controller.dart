import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:recything_application/screens/report_litter/success_report_litter_screen.dart';
import 'package:recything_application/services/report_litter/report_litter_service.dart';
import 'package:recything_application/widgets/global_image_picker_dialog_widget.dart';

class ReportLitterController extends GetxController {
  TextEditingController conditionController = TextEditingController();
  RxString title = ''.obs;
  RxString condition = ''.obs;
  RxString litterType = ''.obs;
  RxString address = ''.obs;
  RxString city = ''.obs;
  RxString province = ''.obs;
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;
  RxList<String> selectedMaterial = <String>[].obs;
  RxBool finishedStepOne = false.obs;

  final ImagePicker _picker = ImagePicker();
  RxList<XFile?> imageFiles = <XFile?>[].obs;

  bool isMaxImagesReached() {
    return imageFiles.length >= 9;
  }

  Future<void> pickImage(ImageSource source) async {
    if (!isMaxImagesReached()) {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFiles.add(pickedFile);
      }
    } else {
      _showSnackbar(
          title: 'Upload Gagal',
          message: 'Jumlah maksimal foto adalah 9',
          contentType: ContentType.failure);
    }
  }

  Future<void> showImageSourceDialog(
      Function(ImageSource) onImageSourceSelected) async {
    return Get.dialog(GlobalImagePickerDialogWidget(
        onImageSourceSelected: onImageSourceSelected));
  }

  void collectData(
    double latitude,
    double longitude,
    String addressInput,
    String cityInput,
    String provinceInput,
  ) {
    lat.value = latitude;
    long.value = longitude;
    address.value = addressInput;
    city.value = cityInput;
    province.value = provinceInput;
    condition.value = conditionController.text;
    selectedMaterial.value = [];
  }

  Future<void> sendLitterReport() async {
    final response = await ReportLitterService().sendReport(this);
    if (response == 201) {
      Get.offAll(const SuccessReportLitterScreen());
    } else {
      Get.snackbar('Error', 'Coba Lagi');
    }
  }

  void replaceImage(int index) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFiles[index] = pickedFile;
    }
  }

  void removeImage(int index) {
    imageFiles.removeAt(index);
  }

  void updateLitterType(String type) {
    litterType.value = type;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title.value,
      'latitude': lat.value,
      'longitude': long.value,
      'address': address.value,
      'city': city.value,
      'province': province.value,
      'waste_materials': [],
      'description': condition.value,
      'waste_type': litterType.value,
      'report_type': 'littering',
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}

void _showSnackbar({
  required String title,
  required String message,
  required ContentType contentType,
}) {
  Get.rawSnackbar(
    backgroundColor: Colors.transparent,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    messageText: AwesomeSnackbarContent(
      titleFontSize: 18,
      messageFontSize: 14,
      title: title,
      message: message,
      contentType: contentType,
    ),
  );
}
