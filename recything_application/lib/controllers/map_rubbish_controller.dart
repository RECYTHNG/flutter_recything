import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:recything_application/screens/report_rubbish/success_report_rubbish_screen.dart';
import 'package:recything_application/screens/report_rubbish/widgets/confirmation_bottomsheet_report_rubbish_widget.dart';
import 'package:recything_application/services/rubbish/rubbish_service.dart';
import 'package:recything_application/widgets/global_image_picker_dialog_widget.dart';

class MapRubbishController extends GetxController {
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
  RxBool sampahBasah = false.obs;
  RxBool sampahKering = false.obs;
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

  bool isMaxImagesReached() {
    return imageFiles.length >= 9;
  }

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void showConfirmationDialog() {
    Get.bottomSheet(
      const ConfirmationBottomsheetReportRubbishWidget()
    );
  }

  Future<void> pickImage(ImageSource source) async {
    if (!isMaxImagesReached()) {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFiles.add(pickedFile);
      }
    } else {
      Get.snackbar("Limit", "Maksimal 9 foto");
    }
  }

  Future<void> showImageSourceDialog(Function(ImageSource) onImageSourceSelected) async {
    return Get.dialog(
      GlobalImagePickerDialogWidget(onImageSourceSelected: onImageSourceSelected)
    );
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
    final response = await ReportRubbishService().sendReport(controller);
    if (response == 201) {
      Get.offAll(const SuccessReportRubbishScreen());
    } else {
      Get.snackbar('Error', 'Coba Lagi');
    }
    print('$response');
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
}