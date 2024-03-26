import 'package:flutter/widgets.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewTodoListController extends GetxController {
  RxList<ListTaskList> lists = <ListTaskList>[].obs;
  final box = GetStorage();
  RxBool active = false.obs;
  RxInt selected = RxInt(-1);
  Rx<TextEditingController> taskTitle=TextEditingController().obs;

  @override
  onInit() async {
    super.onInit();
    List<dynamic> stored = await box.read('lists');
    print(stored.length);
    print(stored);
    lists.value = stored.map((e) => ListTaskList.fromJson(e)).toList();
    update();
    print(" list ${lists.length}");
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
    lists[index].taskList.clear();
    update();
    savetoStorage();
  }

  addList(ListTaskList listTitle) {
    lists.add(listTitle);
    update();
    savetoStorage();
  }

  addTask(Task newTask, int index) {
    int taskId = lists[index].taskList.length + 1;
    newTask.id = taskId;
    lists[index].taskList.add(newTask);

    update();
    savetoStorage();
  }

  deleteList(ListTaskList listTitle) {
    lists.remove(listTitle);
    update();
    savetoStorage();
  }

  deleteTask(Task newTask, int index) {
    print(newTask.id);
    lists[index].taskList.removeWhere((element) => element.id == newTask.id);
    update();
    savetoStorage();
  }

  toggleCheckbox(Task task) {
    task.isDone = !task.isDone!;
    update();
    savetoStorage();
  }

  savetoStorage() async {
    await box.write('lists', lists);
  }
}
