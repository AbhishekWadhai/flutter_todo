import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class InsightsController extends GetxController {
  Rx<ListTaskList> title = ListTaskList.empty().obs;
  String heading = "";
  int hrs = 0;
  int blocks = 0;
  int count = 0;
  List<Task> q1 = <Task>[];
  List<Task> q2 = <Task>[];
  List<Task> q3 = <Task>[];
  List<Task> q4 = <Task>[];

  @override
  void onInit() {
    super.onInit();
    final data = Get.arguments;
    title = data;
    String day = Jiffy.now().format(pattern: "MMM  do").toString();
    if (title.value.listName == day) {
      heading = "Today";
    }
    taskhrs();
    workedhrs();
  }

  taskhrs() {
    for (int i = 0; i < title.value.taskList.length; i++) {
      String start = title.value.taskList[i].startTime!.split(":")[0];
      String end = title.value.taskList[i].endTime!.split(":")[0];
      int s = int.parse(start);
      int e = int.parse(end);
      title.value.taskList[i].duration = e - s;
      if (s >= 0 && e < 6) {
        for (int j = 0; j < title.value.taskList[i].duration! * 2; j++) {
          q1.add(title.value.taskList[i]);
        }
      } else if (s >= 6 && e < 12) {
        for (int j = 0; j < title.value.taskList[i].duration! * 2; j++) {
          q2.add(title.value.taskList[i]);
        }
      } else if (s >= 12 && e < 18) {
        for (int j = 0; j < title.value.taskList[i].duration! * 2; j++) {
          q3.add(title.value.taskList[i]);
        }
      } else if (s >= 18 && e <= 23) {
        for (int j = 0; j < title.value.taskList[i].duration! * 2; j++) {
          q4.add(title.value.taskList[i]);
        }
      }

      if (title.value.taskList[i].duration != 0) {
        blocks = 2 * hrs;
      } else {
        blocks = 2;
        print(blocks);
      }
    }
  }

  workedhrs() {
    for (int i = 0; i < title.value.taskList.length; i++) {
      if (title.value.taskList[i].isDone == true) {
        hrs += title.value.taskList[i].duration!;
        ++count;
      }
    }
  }
}
