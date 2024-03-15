import 'package:flutter_todo/model/list_task_list.dart';

class TodoList {
  List<ListTaskList>? todoLists;

  TodoList(this.todoLists);

  TodoList.fromJson(Map<String, dynamic> json) {
    this.todoLists = List<ListTaskList>.from(json['todoLists']);
  }
  Map<String, dynamic> toJson() {
    return {'todoLists': todoLists};
  }
}
