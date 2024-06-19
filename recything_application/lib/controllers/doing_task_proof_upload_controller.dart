import 'package:get/get.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_progress_screen.dart';
import 'package:recything_application/screens/detail_mission/waiting_verification_screen.dart';
import 'package:recything_application/services/detail_mission_service/post_image_proof_servide.dart';

class DoingTaskProofUploadController extends GetxController {
  final PostImageProofService _taskStepService = PostImageProofService();
  final List<String> selectedImages = [];

  Future<void> uploadProof(String userTaskId, String description) async {
    try {
      if (selectedImages.isEmpty) {
        print('Please select at least one image');
        return;
      }

      List<String> imagePaths = selectedImages.map((image) => image).toList();
      print(imagePaths);
      print(description);

      await _taskStepService.uploadFiles(userTaskId, imagePaths, description);
      Get.to(
        () => WaitingVerificationScreen,
      );

      print('Success: Proof uploaded successfully');
    } catch (e) {
      print('Error: Failed to upload proof: $e');
    }
  }
}
