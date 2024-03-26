
import 'package:flutter_todo/model/task.dart';

class ListTaskList {
  String? listName;
  List<Task> taskList = <Task>[];

  ListTaskList({this.listName, required this.taskList});

  ListTaskList.fromJson(Map<String, dynamic> json) {
    listName = json['listName'];
    // Check if 'taskList' exists in the JSON and is not null
    if (json['taskList'] != null) {
      // Parse each item in 'taskList' as a Map<String, dynamic>
      // and convert it to a Task object using Task.fromJson
      taskList = List<Task>.from(
          json['taskList'].map((taskJson) => Task.fromJson(taskJson)));
    } else {
      taskList = []; // Set an empty list as fallback
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listName'] = this.listName;
    data['taskList'] = this.taskList.map((v) => v.toJson()).toList();
    return data;
  }
}

// ListTaskList.fromJson(Map<String, dynamic> json) {
  //   this.listName = json['listName'];
  //   this.taskList = json['taskList'].map((i) => Task.fromJson(i)).toList();
  // }