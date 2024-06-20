class UserDashboardChallengeModel {
  final int code;
  final String message;
  final List<Datum> data;

  UserDashboardChallengeModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory UserDashboardChallengeModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List<dynamic>? ?? [];
    List<Datum> dataList = list.map((i) => Datum.fromJson(i)).toList();

    return UserDashboardChallengeModel(
      code: json['code'],
      message: json['message'],
      data: dataList,
    );
  }
}

class Datum {
  final String id;
  final String statusProgress;
  final String statusAccept;
  final TaskChallenge taskChallenge;

  Datum({
    required this.id,
    required this.statusProgress,
    required this.statusAccept,
    required this.taskChallenge,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'] ?? '',
      statusProgress: json['status_progress'] ?? '',
      statusAccept: json['status_accept'] ?? '',
      taskChallenge: TaskChallenge.fromJson(json['task_challenge'] ?? {}),
    );
  }
}

class TaskChallenge {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final String startDate;
  final String endDate;
  final int point;
  final bool statusTask;
  final List<TaskStep> taskSteps;
  final List<UserStep> userSteps;

  TaskChallenge({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.startDate,
    required this.endDate,
    required this.point,
    required this.statusTask,
    required this.taskSteps,
    required this.userSteps,
  });

  factory TaskChallenge.fromJson(Map<String, dynamic> json) {
    var taskList = json['task_steps'] as List<dynamic>? ?? [];
    List<TaskStep> taskStepsList = taskList.map((i) => TaskStep.fromJson(i)).toList();
    var stepList = json['user_steps'] as List<dynamic>? ?? [];
    List<UserStep> userStepsList = stepList.map((i) => UserStep.fromJson(i)).toList();

    return TaskChallenge(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      point: json['point'] ?? 0,
      statusTask: json['status_task'] ?? false,
      taskSteps: taskStepsList,
      userSteps: userStepsList,
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

class UserStep {
  final int id;
  final String userTaskChallengeId;
  final int taskStepId;
  final bool completed;

  UserStep({
    required this.id,
    required this.userTaskChallengeId,
    required this.taskStepId,
    required this.completed,
  });

  factory UserStep.fromJson(Map<String, dynamic> json) {
    return UserStep(
      id: json['id'] ?? 0,
      userTaskChallengeId: json['user_task_challenge_id'] ?? '',
      taskStepId: json['task_step_id'] ?? 0,
      completed: json['completed'] ?? false,
    );
  }
}
