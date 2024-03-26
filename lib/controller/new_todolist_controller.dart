import 'package:flutter/widgets.dart';
import 'package:flutter_todo/controller/first_controller.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';

class NewTodoListController extends GetxController {
  // RxList<ListTaskList> lists = <ListTaskList>[].obs;
  //final box = GetStorage();
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
    title.value = data[0];
    listNo.value = data[1];

    // List<dynamic> stored = box.read('lists');

    // lists.value = stored.map((e) => ListTaskList.fromJson(e)).toList();
    // update();
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
    fc.lists[index].taskList.clear();
    update();
    fc.savetoStorage();
  }

  // addList(ListTaskList listTitle) {
  //   fc.lists.add(listTitle);
  //   update();
  //   fc.savetoStorage();
  // }

  addTask(Task newTask, int index) {
    int taskId = fc.lists[index].taskList.length + 1;
    newTask.id = taskId;
    fc.lists[index].taskList.add(newTask);

    update();
    fc.savetoStorage();
  }

  // deleteList(ListTaskList listTitle) {
  //   fc.lists.remove(listTitle);
  //   update();
  //   fc.savetoStorage();
  // }

  deleteTask(Task newTask, int index) {
    print(newTask.id);
    fc.lists[index].taskList.removeWhere((element) => element.id == newTask.id);
    update();
    fc.savetoStorage();
  }

  toggleCheckbox(Task task) {
    task.isDone = !task.isDone!;
    update();
    fc.savetoStorage();
  }

  // savetoStorage() async {
  //   await box.write('lists', lists);
  // }
}


// import 'package:flutter/widgets.dart';
// import 'package:flutter_todo/model/list_task_list.dart';
// import 'package:flutter_todo/model/task.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class NewTodoListController extends GetxController {
//   RxList<ListTaskList> lists = <ListTaskList>[].obs;
//   final box = GetStorage();
//   RxBool active = false.obs;
//   RxInt selected = RxInt(-1);
//   Rx<TextEditingController> taskTitle = TextEditingController().obs;

//   Rx<ListTaskList> title = ListTaskList.empty().obs;
//   Rx<int> listNo = 0.obs;
//   @override
//   onInit() {
//     super.onInit();
//     final data = Get.arguments;
//     title = data[0];
//     listNo = data[1];

//     List<dynamic> stored = box.read('lists');

//     lists.value = stored.map((e) => ListTaskList.fromJson(e)).toList();
//     update();
//   }
  

//   isSelected(int index) {
//     active.value = true;
//     if (selected.value == index) {
//       active.value = false;
//       selected.value = -1;
//     } else {
//       selected.value = index;
//     }
//   }

//   clearList(int index) {
//     lists[index].taskList.clear();
//     update();
//     savetoStorage();
//   }

//   addList(ListTaskList listTitle) {
//     lists.add(listTitle);
//     update();
//     savetoStorage();
//   }

//   addTask(Task newTask, int index) {
//     int taskId = lists[index].taskList.length + 1;
//     newTask.id = taskId;
//     lists[index].taskList.add(newTask);

//     update();
//     savetoStorage();
//   }

//   deleteList(ListTaskList listTitle) {
//     lists.remove(listTitle);
//     update();
//     savetoStorage();
//   }

//   deleteTask(Task newTask, int index) {
//     print(newTask.id);
//     lists[index].taskList.removeWhere((element) => element.id == newTask.id);
//     update();
//     savetoStorage();
//   }

//   toggleCheckbox(Task task) {
//     task.isDone = !task.isDone!;
//     update();
//     savetoStorage();
//   }

//   savetoStorage() async {
//     await box.write('lists', lists);
//   }
// }
