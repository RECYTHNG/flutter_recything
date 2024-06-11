import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/achievement_model.dart';
import 'package:recything_application/services/achievement/achievement_service.dart';

class AchievementController extends GetxController {
  var isLoading = false.obs;
  var achievementResult = AchievementModel().obs;

  @override
  void onInit() {
    getAchievement();
    super.onInit();
  }

  Future<void> getAchievement() async {
    isLoading.value = true;

    try {
      final result = await AchievementService().getAchievement();
      achievementResult.value = result;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
