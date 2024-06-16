import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:recything_application/models/challenge/dashboard/achievement_dashboard_challenge_model.dart';
import 'package:recything_application/models/challenge/dashboard/all_dashboard_challenge_model.dart';
import 'package:recything_application/models/challenge/dashboard/user_dashboard_challenge_model.dart' as user_challenge;
import 'package:recything_application/services/challenge/dashboard/achievement_dashboard_challenge_service.dart';
import 'package:recything_application/services/challenge/dashboard/dashboard_challenge_service.dart';

class ChallengeDashboardController extends GetxController {
  Rxn<AchievementDashboardChallengeModel> userAchievementData = Rxn<AchievementDashboardChallengeModel>();
  Rxn<AllDashboardChallengeModel> challengeData = Rxn<AllDashboardChallengeModel>();
  Rxn<user_challenge.UserDashboardChallengeModel> onProgressChallengeData = Rxn<user_challenge.UserDashboardChallengeModel>();
  Rxn<user_challenge.UserDashboardChallengeModel> doneChallengeData = Rxn<user_challenge.UserDashboardChallengeModel>();
  Rxn<user_challenge.UserDashboardChallengeModel> historyChallengeData = Rxn<user_challenge.UserDashboardChallengeModel>();
  RxBool isLoadingFetchOnProgressChallenge = RxBool(false);
  RxBool isLoadingFetchAllChallenge = RxBool(false);
  RxBool isLoadingFetchUserAchievement = RxBool(false);
  RxBool isLoadingFetchDoneChallenge = RxBool(false);
  RxBool isLoadingFetchHistoryChallenge = RxBool(false);
  Rxn<List<user_challenge.Datum>> doneChallengeSectionData = Rxn<List<user_challenge.Datum>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchUserAchievement();
    fetchAllChallenge();
    fetchOnProgressChallenge();
  }

  void fetchDoneChallengeSection() {
    fetchDoneChallenge();
    fetchHistoryChallenge();
    List<user_challenge.Datum> listData = [];
    if (doneChallengeData.value != null) {
      listData.addAll(doneChallengeData.value!.data);
    }
    if (historyChallengeData.value != null) {
      listData.addAll(historyChallengeData.value!.data);
    }
    doneChallengeSectionData.value = listData;
  }

  String getFirstName() {
    List<String> name = userAchievementData.value!.data.dataUser.name.split(' ');
    return name[0];
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

  Future<void> fetchDoneChallenge() async {
    isLoadingFetchDoneChallenge.value = true;
    try {
      final response = await DashboardChallengeService().getDoneChallenge();
      doneChallengeData.value = response;
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    } finally {
      isLoadingFetchDoneChallenge.value = false;
    }
  }

  Future<void> fetchHistoryChallenge() async {
    isLoadingFetchHistoryChallenge.value = true;
    try {
      final response = await DashboardChallengeService().getHistoryChallenge();
      historyChallengeData.value = response;
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    } finally {
      isLoadingFetchHistoryChallenge.value = false;
    }
  }

  Future<void> fetchAllChallenge() async {
    isLoadingFetchAllChallenge.value = true;
    try {
      final response = await DashboardChallengeService().getAllChallenge();
      challengeData.value = response;
      isLoadingFetchAllChallenge.value = false;
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