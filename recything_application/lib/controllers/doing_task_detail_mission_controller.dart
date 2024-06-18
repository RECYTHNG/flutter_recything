import 'package:get/get.dart';
import 'package:recything_application/services/detail_mission_service/task_step_service.dart';

class DoingTaskDetailMissionController extends GetxController {
  var dataGetStartTask = {}.obs;
  var dataGetProgress = {}.obs;
  var dataStartTask = {}.obs;
  var dataPutStepTask = {}.obs;

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
        dataGetStartTask.value = responseData['data'];
        update();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> getDataTaskProgress(String userTaskId) async {
    try {
      final responseData = await _taskService.getTaskProgressById(userTaskId);
      if (responseData.containsKey('data')) {
        dataGetProgress.value = responseData['data'];
        taskStepCount += 1;
        taskStepId = dataGetProgress['task_challenge']['user_steps']
            [taskStepCount]['task_step_id'];
        _createUserStepCompletionMap();
        if (taskStepCount == userStepCompletionMap.length) {
          buttonUpload = true;
        }
        print('TaskStep: $taskStepId');
        print('userStep: $userStepCompletionMap');
        print('taskStepcount: $taskStepCount');
        print('usersteplength: ${userStepCompletionMap.length}');
        update();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> startTask(String taskId, RxMap<dynamic, dynamic> data) async {
    try {
      final response = await _taskService.postTaskById(taskId, data);
      print('Response: $response');
      if (response.containsKey('data')) {
        dataStartTask.value = response['data'];
        update();
      } else {
        throw Exception('Failed to get valid response from API');
      }
    } catch (e) {
      throw Exception('Failed to start task: $e');
    }
  }

  Future<void> putTaskStepCompletion(String userTaskId) async {
    try {
      final response =
          await _taskService.putTaskStepCompletion(userTaskId, taskStepId);
      if (response.containsKey('data')) {
        dataPutStepTask.value = response['data'];
        await getDataTaskProgress(userTaskId);
        update();
      } else {
        throw Exception('Failed to get valid response from API');
      }
    } catch (e) {
      throw Exception('Failed to update task step completion: $e');
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
    }
  }

  bool isStepCompleted(int stepId) {
    print(stepId);
    return userStepCompletionMap[stepId] ?? false;
  }
}
