import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';

class TimeController extends GetxController {
  RxString startTime = 'now'.obs;
  RxString endTime = ' '.obs;
  RxList<String> range = <String>["9","10"].obs;
  RxString time1 = 'x'.obs;
  RxString time2 = 'x'.obs;
  RxList<String> timeS = <String>[].obs;
  int f = 0;
  late Task hTask;

  selectRange(String time) {
    if (time1.value == "x") {
      time1.value = time;
    } else if (time2.value != time) {
      time2.value = time;
    } else {
      time1.value = "x";
      //range.clear();
    }
    //else {
    //   f = 0;
    //   time1.value = "x";
    //   range.clear();
    // }
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
    print(endTime);
  }

  format24hrs(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  // bool getCard(ListTaskList title) {
  //   for (Task t in title.taskList) {
  //     if (t.startTime![0] == startTime.value[0] &&
  //         t.startTime![1] == startTime.value[1]) {
  //       hTask = t;
  //       return true;
  //     }
  //   }
  //   return false;
  // }
}
