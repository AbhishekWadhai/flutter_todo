import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/services/storage_service.dart';
import 'package:get/get.dart';

class NewTodoListController extends GetxController {
  List<ListTaskList> lists = <ListTaskList>[];
  RxBool active = false.obs;
  RxInt selected = RxInt(-1);
  Rx<TextEditingController> taskTitle = TextEditingController().obs;
  Rx<ListTaskList> title = ListTaskList.empty().obs;
  Rx<int> listNo = 0.obs;

  @override
  onInit() {
    super.onInit();
    final data = Get.arguments;
    lists = data[0];
    title.value = data[1] ?? ListTaskList.empty();
    listNo.value = data[2] ?? 0;
    print(listNo);
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

  addTask(Task newTask, int index) async{
    int taskId = lists[index].taskList.length + 1;
    newTask.id = taskId;
    await saveTask(newTask);
    update();
    //title.value.taskList.add(newTask);
  }

  deleteTask(Task newTask, int index) {
    lists[listNo.value]
        .taskList
        .removeWhere((element) => element.id == newTask.id);
    title.value.taskList.removeWhere((element) => element.id == newTask.id);
    active.value = false;
    update();
    StoragePreferences.setListTaskLists(lists);
  }

  toggleCheckbox(Task task) {
    task.isDone = !task.isDone!;
    update();
    StoragePreferences.setListTaskLists(lists);
  }

  clearList() {
    title.value.taskList.clear();
    lists[listNo.value].taskList.clear();
    update();
    StoragePreferences.setListTaskLists(lists);
  }

  saveTask(Task newTask) async {
    lists[listNo.value].taskList.add(newTask);
    StoragePreferences.setListTaskLists(lists);
  }
}
