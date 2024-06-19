import 'dart:convert';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:recything_application/screens/report_litter/success_report_litter_screen.dart';
import 'package:recything_application/services/report_litter/report_litter_service.dart';

class ReportLitterController extends GetxController {
  TextEditingController conditionController = TextEditingController();
  RxString title = RxString('');
  RxString condition = RxString('');
  RxString litterType = RxString('');
  RxString address = RxString('');
  RxString city = RxString('');
  RxString province = RxString('');
  RxDouble lat = RxDouble(0.0);
  RxDouble long = RxDouble(0.0);
  RxList<String> selectedMaterial = <String>[].obs;
  RxBool finishedStepOne = false.obs;

  final ImagePicker _picker = ImagePicker();
  RxList<XFile?> imageFiles = RxList<XFile?>([]);

  RxInt currentIndex = 0.obs;

  bool isMaxImagesReached() {
    return imageFiles.length >= 9;
  }

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  Future<void> pickImage() async {
    if (!isMaxImagesReached()) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFiles.add(pickedFile);
      }
    } else {
      Get.snackbar("Limit", "Maksimal 9 foto");
    }
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

    changeTabIndex(1);
  }

  void sendLitterReport(ReportLitterController controller) async {
    final response = await ReportLitterService().sendReport(controller);
    if (response == 201) {
      Get.offAll(const SuccessReportLitterScreen());
    } else {
      Get.snackbar('Error', 'Coba Lagi');
    }
    print('$response');
  }

  void replaceImage(int index) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFiles[index] = pickedFile;
    }
  }

  void moveNextTab() {
    if (currentIndex.value < 1) {
      currentIndex.value++;
    }
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
      'report_type': 'rubbish',
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}
