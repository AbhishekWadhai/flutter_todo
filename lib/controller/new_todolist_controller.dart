import 'package:flutter/widgets.dart';
import 'package:flutter_todo/controller/first_controller.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';

class NewTodoListController extends GetxController {
  RxBool active = false.obs;
  RxInt selected = RxInt(-1);
  Rx<TextEditingController> taskTitle = TextEditingController().obs;
  Rx<ListTaskList> title = ListTaskList.empty().obs;
  Rx<int> listNo = 0.obs;
  FirstController fc = FirstController();
  @override
  onInit() {
    super.onInit();
    final data = Get.arguments;
    title.value = data[0] ?? ListTaskList.empty();
    listNo.value = data[1] ?? 0;
  }

  isSelected(int index) {
    active.value = true;
    if (selected.value == index) {
      active.value = false;
      selected.value = -1;
    } else {
      selected.value = index;
    }
  }

  clearList(int index) {
    title.value.taskList.clear();
    update();
  }

  addTask(Task newTask, int index) {
    int taskId = title.value.taskList.length + 1;
    newTask.id = taskId;
    title.value.taskList.add(newTask);

    update();
    fc.savetoStorage();
  }

  deleteTask(Task newTask, int index) {
    title.value.taskList.removeWhere((element) => element.id == newTask.id);
    update();
    fc.savetoStorage();
  }

  toggleCheckbox(Task task) {
    task.isDone = !task.isDone!;
    update();
    fc.savetoStorage();
  }
}
