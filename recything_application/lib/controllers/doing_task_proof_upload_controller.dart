import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_application/screens/detail_mission/waiting_verification_screen.dart';
import 'package:recything_application/services/detail_mission_service/post_image_proof_servide.dart';

class DoingTaskProofUploadController extends GetxController {
  final PostImageProofService _taskStepService = PostImageProofService();
  var selectedImages = <String>[].obs;
  var isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    if (selectedImages.length < 12) {
      if (source == ImageSource.camera) {
        final XFile? photo = await _picker.pickImage(source: source);
        if (photo != null) {
          selectedImages.add(photo.path);
        }
      } else {
        final List<XFile>? images = await _picker.pickMultiImage();
        if (images != null && images.isNotEmpty) {
          if (selectedImages.length + images.length <= 12) {
            selectedImages.addAll(images.map((image) => image.path).toList());
          } else {
            Get.snackbar('Maximum Photos Reached',
                'You can only select up to 12 photos.');
          }
        }
      }
    } else {
      Get.snackbar(
          'Maximum Photos Reached', 'You can only select up to 12 photos.');
    }
  }

  bool isMaxImagesReached() {
    return selectedImages.length >= 12;
  }

  Future<void> uploadProof(
      String userTaskId, String description, String statusAccept) async {
    isLoading.value = true;
    if (selectedImages.isEmpty) {
      Get.snackbar('Error', 'Please select at least one image');
      return;
    }

    try {
      List<String> imagePaths = selectedImages.map((image) => image).toList();
      await _taskStepService.uploadFiles(
          userTaskId, imagePaths, description, statusAccept);
      Get.to(() => WaitingVerificationScreen());
    } catch (e) {
      print('Error: Failed to upload proof: $e');
      Get.snackbar('Error', 'Failed to upload proof: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void replaceImage(int index) async {
    final XFile? newImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (newImage != null) {
      selectedImages[index] = newImage.path;
    }
  }
}
