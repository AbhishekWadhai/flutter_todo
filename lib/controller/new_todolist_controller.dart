



import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';

class NewTodoListController extends GetxController {
  RxList<ListTaskList> lists = <ListTaskList>[].obs;
  final box = GetStorage();

  @override
  onInit() async {
    super.onInit();
    List<dynamic> stored = box.read('lists');
    print(stored.length);
    print(stored);
    lists.value = await stored.map((e) => ListTaskList.fromJson(e)).toList();

    print(" list ${lists.length}");
  }

  addList(ListTaskList listTitle) {
    lists.add(listTitle);
    update();
    savetoStorage();
  }

  addTask(Task newTask, int index) {
    lists[index].taskList.add(newTask);
    update();
    savetoStorage();
  }

  setTime(){
   
  }

  deleteList(ListTaskList listTitle) {
    lists.remove(listTitle);
    update();
    savetoStorage();
  }

  deleteTask(Task newTask, int index) {
    lists[index].taskList.remove(newTask);
    update();
    savetoStorage();
  }

  toggleCheckbox(Task task, int index) {
    task.isDone = !task.isDone!;
    update();
    savetoStorage();
  }

  
  
  
  
  
  
  
  savetoStorage() async {
    await box.write('lists', lists);
  }
  
  }

