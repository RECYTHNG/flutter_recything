import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/challenge/dashboard/achievement_dashboard_challenge_model.dart';
import 'package:recything_application/models/challenge/all_challenge_model.dart';
import 'package:recything_application/models/challenge/dashboard/on_progress_dashboard_challenge_model.dart';
import 'package:recything_application/services/challenge/achievement_dashboard_challenge_service.dart';
import 'package:recything_application/services/challenge/dashboard/dashboard_challenge_service.dart';

class ChallengeDashboardController extends GetxController {
  Rxn<AchievementDashboardChallengeModel> userAchievementData = Rxn<AchievementDashboardChallengeModel>();
  Rxn<AllChallengeModel> challengeData = Rxn<AllChallengeModel>();
  Rxn<OnProgressDashboardChallengeModel> onProgressChallengeData = Rxn<OnProgressDashboardChallengeModel>();
  RxBool isLoadingFetchOnProgressChallenge = RxBool(false);
  RxBool isLoadingFetchAllChallenge = RxBool(false);
  RxBool isLoadingFetchUserAchievement = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    fetchUserAchievement();
    fetchAllChallenge();
    fetchOnProgressChallenge();
  }

  Future<void> fetchUserAchievement() async {
    isLoadingFetchUserAchievement.value = true;
    try {
      final response = await AchievementDashboardChallengeService().getAchievement();
      userAchievementData.value = response;
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    } finally {
      isLoadingFetchUserAchievement.value = false;
    }
  }

  Future<void> fetchAllChallenge() async {
    isLoadingFetchAllChallenge.value = true;
    try {
      final response = await DashboardChallengeService().getAllChallenge();
      challengeData.value = response;
      print(' berhasil $response');
      isLoadingFetchAllChallenge.value = false;
      print(isLoadingFetchAllChallenge);
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    } finally {
      isLoadingFetchAllChallenge.value = false;
    }
  }

  Future<void> fetchOnProgressChallenge() async {
    isLoadingFetchOnProgressChallenge.value = true;
    try {
      final response = await DashboardChallengeService().getOnProgressChallenge();
      onProgressChallengeData.value = response;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoadingFetchOnProgressChallenge.value = false;
    }
  }
}