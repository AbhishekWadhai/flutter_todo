import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class InsightsController extends GetxController {
  List<ListTaskList> lists = <ListTaskList>[];
  ListTaskList title = ListTaskList.empty();
  Rx<ListTaskList> title2 = ListTaskList.empty().obs;
  Rx<ListTaskList> title3 = ListTaskList.empty().obs;

  String heading = "";
  String heading2 = Jiffy.now().subtract(days: 1).format(pattern: "MMM  do").toString();
  String heading3 = "";
  int hrs = 0;
  int blocks = 0;
  int count = 0;
  List<Task> tq1 = <Task>[];
  List<Task> tq2 = <Task>[];
  List<Task> tq3 = <Task>[];
  List<Task> tq4 = <Task>[];
  List<Task> yq1 = <Task>[];
  List<Task> yq2 = <Task>[];
  List<Task> yq3 = <Task>[];
  List<Task> yq4 = <Task>[];
  List<Task> aq1 = <Task>[];
  List<Task> aq2 = <Task>[];
  List<Task> aq3 = <Task>[];
  List<Task> aq4 = <Task>[];

  @override
  void onInit() {
    super.onInit();
    final data = Get.arguments;
    title = data[0];
    lists = data[1];
    String day = Jiffy.now().format(pattern: "MMM  do").toString();
    if (title.listName == day) {
      heading = "Today";
    } else {
      heading = title.listName!;
    }
    String day1 =
        Jiffy.now().subtract(days: 1).format(pattern: "MMM  do").toString();

    heading3 =
        Jiffy.now().subtract(days: 2).format(pattern: "MMM  do").toString();

    if (lists.length == 2) {
      title2.value = lists.firstWhere((element) => element.listName == day1);
      if (title2.value.listName == day1) {
        heading2 = "Yesterday";
      } else {
        heading2 = day1;
      }
    }

    if (lists.length == 3) {
      title2.value = lists.firstWhere((element) => element.listName == day1);
      if (title2.value.listName == day1) {
        heading2 = "Yesterday";
      } else {
        heading2 = day1;
      }
      title3.value =
          lists.firstWhere((element) => element.listName == heading3);
    }

    taskhrs();
    workedhrs();
    yesterdayInsights();
    anydayInsights();
  }

  taskhrs() {
    for (int i = 0; i < title.taskList.length; i++) {
      String start = title.taskList[i].startTime?.split(":")[0] ?? "01";
      String end = title.taskList[i].endTime?.split(":")[0] ?? "00";
      int s = int.parse(start);
      int e = int.parse(end);
      title.taskList[i].duration = e - s;
      if (s >= 0 && s < 6) {
        for (int j = 0; j < title.taskList[i].duration! * 2; j++) {
          tq1.add(title.taskList[i]);
        }
      } else if (s >= 6 && s < 12) {
        for (int j = 0; j < title.taskList[i].duration! * 2; j++) {
          tq2.add(title.taskList[i]);
        }
      } else if (s >= 12 && s < 18) {
        for (int j = 0; j < title.taskList[i].duration! * 2; j++) {
          tq3.add(title.taskList[i]);
        }
      } else if (s >= 18 && s <= 23) {
        for (int j = 0; j < title.taskList[i].duration! * 2; j++) {
          tq4.add(title.taskList[i]);
        }
      }
    }
  }

  workedhrs() {
    for (int i = 0; i < title.taskList.length; i++) {
      if (title.taskList[i].isDone == true) {
        hrs += title.taskList[i].duration!;
        ++count;
      }
    }
  }

  yesterdayInsights() {
    for (int i = 0; i < title2.value.taskList.length; i++) {
      String start = title2.value.taskList[i].startTime?.split(":")[0] ?? "01";
      String end = title2.value.taskList[i].endTime?.split(":")[0] ?? "00";
      int s = int.parse(start);
      int e = int.parse(end);
      title2.value.taskList[i].duration = e - s;
      if (s >= 0 && s < 6) {
        for (int j = 0; j < title2.value.taskList[i].duration! * 2; j++) {
          yq1.add(title2.value.taskList[i]);
        }
      } else if (s >= 6 && s < 12) {
        for (int j = 0; j < title2.value.taskList[i].duration! * 2; j++) {
          yq2.add(title2.value.taskList[i]);
        }
      } else if (s >= 12 && s < 18) {
        for (int j = 0; j < title2.value.taskList[i].duration! * 2; j++) {
          yq3.add(title2.value.taskList[i]);
        }
      } else if (s >= 18 && s <= 23) {
        for (int j = 0; j < title2.value.taskList[i].duration! * 2; j++) {
          yq4.add(title2.value.taskList[i]);
        }
      }
    }
  }

  anydayInsights() {
    for (int i = 0; i < title3.value.taskList.length; i++) {
      String start = title3.value.taskList[i].startTime?.split(":")[0] ?? "01";
      String end = title3.value.taskList[i].endTime?.split(":")[0] ?? "00";
      int s = int.parse(start);
      int e = int.parse(end);
      title3.value.taskList[i].duration = e - s;
      if (s >= 0 && s < 6) {
        for (int j = 0; j < title3.value.taskList[i].duration! * 2; j++) {
          aq1.add(title3.value.taskList[i]);
        }
      } else if (s >= 6 && s < 12) {
        for (int j = 0; j < title3.value.taskList[i].duration! * 2; j++) {
          aq2.add(title3.value.taskList[i]);
        }
      } else if (s >= 12 && s < 18) {
        for (int j = 0; j < title3.value.taskList[i].duration! * 2; j++) {
          aq3.add(title3.value.taskList[i]);
        }
      } else if (s >= 18 && s <= 23) {
        for (int j = 0; j < title3.value.taskList[i].duration! * 2; j++) {
          aq4.add(title3.value.taskList[i]);
        }
      }
    }
  }
}
