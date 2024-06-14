class AllChallengeModel {
  final int code;
  final String message;
  final List<Datum> data;

  AllChallengeModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AllChallengeModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List<dynamic>? ?? [];
    List<Datum> dataList = list.map((i) => Datum.fromJson(i)).toList();

    return AllChallengeModel(
      code: json['code'],
      message: json['message'],
      data: dataList,
    );
  }
}

class Datum {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final String startDate;
  final String endDate;
  final int point;
  final bool status;
  final List<TaskStep> taskSteps;

  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.startDate,
    required this.endDate,
    required this.point,
    required this.status,
    required this.taskSteps,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    var list = json['task_steps'] as List<dynamic>? ?? [];
    List<TaskStep> taskStepsList = list.map((i) => TaskStep.fromJson(i)).toList();

    return Datum(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      point: json['point'] ?? 0,
      status: json['status'] ?? false,
      taskSteps: taskStepsList,
    );
  }
}

class TaskStep {
  final int id;
  final String title;
  final String description;

  TaskStep({
    required this.id,
    required this.title,
    required this.description,
  });

  factory TaskStep.fromJson(Map<String, dynamic> json) {
    return TaskStep(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
