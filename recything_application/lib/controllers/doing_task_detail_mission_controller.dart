import 'package:get/get.dart';
import 'package:recything_application/services/detail_mission_service/get_task_service.dart';

class DoingTaskDetailMissionController extends GetxController {
  var data = {}.obs; // Using RxMap for reactivity
  final GetTaskService _getTaskService = GetTaskService();

  Map<int, bool> userStepCompletionMap = {};

  Future<void> getData(String userTaskId) async {
    try {
      final responseData = await _getTaskService.getDataChallenge(userTaskId);
      if (responseData.containsKey('data')) {
        data.value = responseData['data'];
        _createUserStepCompletionMap();
        update();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  void _createUserStepCompletionMap() {
    userStepCompletionMap.clear();
    if (data.containsKey('task_challenge')) {
      for (var userStep in data['task_challenge']['user_steps']) {
        userStepCompletionMap[userStep['task_step_id']] = userStep['completed'];
      }
    }
  }

  bool isStepCompleted(int stepId) {
    return userStepCompletionMap[stepId] ?? false;
  }
}
