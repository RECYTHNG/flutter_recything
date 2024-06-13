import 'package:get/get.dart';
import 'package:recything_application/services/detail_mission_service/get_task_service.dart';

class DoingTaskDetailMissionController extends GetxController {
  var data;

  final GetTaskService _getTaskService = GetTaskService();

  Future<void> getData(String taskId) async {
    try {
      final responseData = await _getTaskService.getDataChallenge(taskId);
      if (responseData.containsKey('data')) {
        data = responseData['data'];
        update();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
