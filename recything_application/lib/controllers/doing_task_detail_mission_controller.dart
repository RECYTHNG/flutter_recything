import 'package:get/get.dart';
import 'package:recything_application/screens/detail_mission/detail_mission_progress_screen.dart';
import 'package:recything_application/services/detail_mission_service/task_step_service.dart';

class DoingTaskDetailMissionController extends GetxController {
  var dataGetTask = {}.obs;
  var dataGetStartTask = {}.obs;
  var dataGetProgress = {}.obs;
  var dataStartTask = {}.obs;
  var dataPutStepTask = {}.obs;
  var isLoading = true.obs;

  final TaskStepService _taskService = TaskStepService();
  int stepCount = 0;
  int taskStepCount = 0;
  int taskStepId = 0;
  bool buttonUpload = false;

  Map<int, bool> userStepCompletionMap = {};

  Future<void> getDataTaskStart(String taskId) async {
    try {
      final responseData = await _taskService.getTaskStart(taskId);
      if (responseData.containsKey('data')) {
        dataGetTask.value = responseData['data'];
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDataTaskProgress(String userTaskId) async {
    try {
      final responseData = await _taskService.getTaskProgressById(userTaskId);
      if (responseData.containsKey('data')) {
        dataGetProgress.value = responseData['data'];
        _createUserStepCompletionMap();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> startTask(String taskId, RxMap<dynamic, dynamic> data) async {
    try {
      final response = await _taskService.postTaskById(taskId, data);
      if (response.containsKey('data')) {
        dataStartTask.value = response['data'];
        Get.to(
          DetailMissionProgressScreen(
            userTaskId: dataStartTask['id'],
          ),
        );
      } else {
        throw Exception('Failed to get valid response from API');
      }
    } catch (e) {
      throw Exception('Failed to start task: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> putTaskStepCompletion(String userTaskId) async {
    try {
      final response =
          await _taskService.putTaskStepCompletion(userTaskId, taskStepId);
      if (response.containsKey('data')) {
        dataPutStepTask.value = response['data'];
        await getDataTaskProgress(userTaskId);
      } else {
        throw Exception('Failed to get valid response from API');
      }
    } catch (e) {
      throw Exception('Failed to update task step completion: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void _createUserStepCompletionMap() {
    userStepCompletionMap.clear();
    stepCount = 1;
    taskStepCount = 0;
    if (dataGetProgress.containsKey('task_challenge')) {
      for (var userStep in dataGetProgress['task_challenge']['user_steps']) {
        userStepCompletionMap[userStep['task_step_id']] = userStep['completed'];
        if (userStep['completed'] == true) {
          stepCount += 1;
          taskStepCount += 1;
        }
      }
      if (taskStepCount == userStepCompletionMap.length) {
        buttonUpload = true;
      }
    }
    taskStepId = dataGetProgress['task_challenge']['user_steps'][taskStepCount]
        ['task_step_id'];
    isLoading.value = false;
  }

  bool isStepCompleted(int stepId) {
    return userStepCompletionMap[stepId] ?? false;
    isLoading.value = false;
  }
}
