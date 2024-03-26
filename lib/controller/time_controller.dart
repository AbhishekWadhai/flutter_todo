import 'package:flutter/material.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';

class TimeController extends GetxController {
  RxString startTime = 'now'.obs;
  RxString endTime = ' '.obs;
  RxList<String>? range = <String>[].obs;
  RxString time1 = 'x'.obs;
  RxString time2 = 'x'.obs;
  RxList<String> timeS = <String>[].obs;
  int f = 0;
 Rx<Task> hTask = Task().obs;

  selectRange(String time) {
    if (time1.value == "x") {
      time1.value = time;
      ++f;
    } else if (time2.value != time) {
      time2.value = time;
      ++f;
    }
    if (f == 2) {
      time1.value = time;
      range!.clear();
      time2.value = "x";
      f = 0;
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
    // for (int i = 0; i < lists.taskList.length; i++) {
    //   if(lists.taskList[i].startTime![0] == time1.value[0] && lists.taskList[i].startTime![1] == time1.value[1]){
    //     hTask.value = lists.taskList[i];
    //     update();
    //     return true;
    //   }
    // }
    return false;
  }
}
