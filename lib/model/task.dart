class Task {
  bool? isDone;
  String? taskName;
  String? startTime;
  String? endTime;
  String? priority;
  

  Task({this.isDone = false, this.taskName, this.startTime, this.endTime, this.priority});

  Task.fromJson(Map<String, dynamic> json) {
    isDone = json["isDone"];
    taskName = json["taskName"];
    startTime = json["startTime"];
    startTime = json["endTime"];
    priority = json["priority"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isDone'] = this.isDone;
    data['taskName'] = this.taskName;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['priority'] = this.priority;
    return data;
  }
}
