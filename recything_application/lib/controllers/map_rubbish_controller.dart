import 'dart:async';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:recything_application/controllers/report_rubbish_controller.dart';
import 'package:recything_application/screens/report_rubbish/success_report_rubbish_screen.dart';
import 'package:recything_application/screens/report_rubbish/widgets/confirmation_bottomsheet_report_rubbish_widget.dart';
import 'package:recything_application/services/rubbish/rubbish_service.dart';
import 'package:recything_application/widgets/global_image_picker_dialog_widget.dart';

class MapRubbishController extends GetxController {
  final ReportRubbishController rubbishController = Get.put(ReportRubbishController());

  RxMap<String, bool> materialData = RxMap({
    'Plastik': false,
    'Kaca': false,
    'Kayu': false,
    'Kertas': false,
    'Baterai': false,
    'Besi': false,
    'Limbah Berbahaya': false,
    'Limbah Beracun': false,
    'Sisa Makanan': false,
    'Tak Terdeteksi': false,
  });

  TextEditingController conditionController = TextEditingController();
  RxString condition = RxString('');
  RxBool sampahBasah = RxBool(false);
  RxBool sampahKering = RxBool(false);
  RxString rubbishType = RxString('');
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

  var tabIndex = 0.obs;
  var isDisabled = <bool>[false, true].obs;

  @override
  void onInit() {
    super.onInit();
    conditionController.addListener(_onFieldChanged);
    address.listen((_) => updateIsDisabled());
    sampahBasah.listen((_) => updateIsDisabled());
    sampahKering.listen((_) => updateIsDisabled());
    materialData.listen((_) => updateIsDisabled());
    updateStateEvery2Seconds();
  }

  @override
  void onClose() {
    conditionController.removeListener(_onFieldChanged);
    super.onClose();
  }

  void _onFieldChanged() {
    updateIsDisabled();
  }

  void updateIsDisabled() {
    isDisabled[1] = !(
      rubbishController.currentAddress.value.isNotEmpty &&
      conditionController.text.isNotEmpty &&
      (sampahBasah.value || sampahKering.value) &&
      materialData.values.any((data) => data)
    );
  }

  bool isMaxImagesReached() {
    return imageFiles.length >= 9;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void showConfirmationDialog() {
    Get.bottomSheet(const ConfirmationBottomsheetReportRubbishWidget());
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

    if (sampahBasah.value == true && sampahKering.value == true) {
      rubbishType.value = 'sampah basah,sampah kering';
    }
    if (sampahBasah.value == true && sampahKering.value != true) {
      rubbishType.value = 'sampah basah';
    }
    if (sampahKering.value == true && sampahBasah.value != true) {
      rubbishType.value = 'sampah kering';
    }

    selectedMaterial.value = materialData.entries
        .where((data) => data.value == true)
        .map((data) => data.key.toLowerCase())
        .toList();

    changeTabIndex(1);
  }

  void sendRubbishReport(MapRubbishController controller) async {
    try {
      final response = await ReportRubbishService().sendReport(controller);
      if (response == 201) {
        Get.offAll(const SuccessReportRubbishScreen());
      }
    } catch (e) {
      Get.back();
      _showSnackbar(
        title: 'Pengiriman Report Gagal',
        message: 'Silakan cek kembali data yang diinputkan',
        contentType: ContentType.failure,
      );
    }
  }

  void replaceImage(int index) async {
    showImageSourceDialog((ImageSource source) async {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFiles[index] = pickedFile;
      }
    });
  }

  void moveNextTab() {
    if (currentIndex.value < 1) {
      currentIndex.value++;
    }
  }

  void updateStateEvery2Seconds() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      update();
    });
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
