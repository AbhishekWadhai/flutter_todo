import 'package:flutter/material.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_todo/model/list_task_list.dart';
// import 'package:flutter_todo/model/task.dart';
// import 'package:get/get.dart';

class TimeController extends GetxController {
  
  RxString startTime = '00:00'.obs;
  RxString endTime = '00:00'.obs;
  RxList<String>? range = <String>[].obs;
  RxString time1 = 'x'.obs;
  RxString time2 = 'x'.obs;
  RxList<String> timeS = <String>[].obs;
  int f = 0;
  Rx<Task> hTask = Task().obs;
  RxBool contain  = false.obs;
  List<String> times = [
    " ",
    "+",
    "08:00",
    "08:30",
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "13:00",
    "13:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00",
    "17:30",
    "18:00",
    "18:30",
    "19:00",
    "19:30",
    "20:00",
    "20:30",
    "21:00",
    "21:30",
    "22:00",
    "22:30",
    "23:00",
    "23:30",
    "+"
  ];

  selectRange(String time, ListTaskList lists) {
    if (time1.value == "x") {
      time1.value = time;
      ++f;
    } else if (time2.value != time) {
      time2.value = time;
      update();
      ++f;
    }
    if (f == 2) {
      time1.value = time;
      range!.clear();
      time2.value = "x";
      f = 0;
    }
    if (time1.value != "x" && time2.value != "x") {
      range!.value = times.sublist(
          times.indexOf(time1.value), times.indexOf(time2.value) + 1);

      cardTask(lists);
    }
  }

  selectStartTime(context) {
    showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    ).then((value) => startTime.value = format24hrs(value!));
  }

  selectEndTime(context) {
    showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    ).then((value) => endTime.value = format24hrs(value!));
  }

  format24hrs(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  cardTask(ListTaskList lists) {
    for (int i = 0; i < lists.taskList.length; i++) {
      for (String r in range!) {
        String sub = r.substring(0, 2);
        if (sub == (lists.taskList[i].startTime!.substring(0, 2)) &&
            lists.taskList[i].isDone == false ) {
          hTask.value = lists.taskList[i];
          update();
          return true;
        }
      }
    }
    update();
    return false;
  }
  
}
