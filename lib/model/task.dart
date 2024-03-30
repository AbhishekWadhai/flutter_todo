class Task {
  int? id;
  bool? isDone;
  int? duration;
  String? taskName;
  String? startTime;
  String? endTime;
  String? priority;

  Task(
      {this.id,
      this.isDone = false,
      this.duration,
      this.taskName,
      this.startTime,
      this.endTime,
      this.priority});

  Task.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    isDone = json["isDone"];
    duration = json["duration"];
    taskName = json["taskName"];
    startTime = json["startTime"];
    startTime = json["endTime"];
    priority = json["priority"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['isDone'] = isDone;
    data['duration'] = duration;
    data['taskName'] = taskName;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['priority'] = priority;
    return data;
  }
}
