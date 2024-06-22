import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/achievement/achievement_model.dart';
import 'package:recything_application/services/achievement/achievement_service.dart';

class AchievementController extends GetxController {
  var isLoading = false.obs;
  var achievementResult = AchievementModel().obs;
  var isError = false.obs;

  @override
  void onInit() {
    getAchievement();
    super.onInit();
  }

  Future<void> getAchievement() async {
    isLoading.value = true;
    try {
      isError(false);
      final result = await AchievementService().getAchievement();
      achievementResult.value = result;
    } catch (e) {
      isError(true);
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
