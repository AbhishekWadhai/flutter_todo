import 'package:flutter_todo/model/list_task_list.dart';
import 'package:get/get.dart';

class FirstController extends GetxController {
  RxList<ListTaskList> lists = <ListTaskList>[].obs;

  addList(ListTaskList listTitle) {
    lists.add(listTitle);
    update();

    print(lists.length);
  }

  deleteList(ListTaskList listTitle) {
    lists.remove(listTitle);
    update();
  }
}
