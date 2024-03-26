import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FirstController extends GetxController {
  RxList<ListTaskList> lists = <ListTaskList>[].obs;
  final box = GetStorage();

  @override
  onInit() {
    super.onInit();
    List<dynamic> stored = box.read('lists');

    lists.value = stored.map((e) => ListTaskList.fromJson(e)).toList();
    update();
  }

  addList(ListTaskList listTitle) {
    lists.add(listTitle);
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

  savetoStorage() async {
    await box.write('lists', lists);
  }
}
