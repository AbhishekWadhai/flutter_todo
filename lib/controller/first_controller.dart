import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/services/storage_service.dart';
import 'package:get/get.dart';

class FirstController extends GetxController {
  RxList<ListTaskList> lists = <ListTaskList>[].obs;

  @override
  onInit() async {
    await loadData();
    super.onInit();
  }

  addList(ListTaskList listTitle) {
    lists.add(listTitle);
    update();
    StoragePreferences.setListTaskLists(lists);
  }

  deleteList(ListTaskList listTitle) {
    lists.remove(listTitle);
    update();
    StoragePreferences.setListTaskLists(lists);
  }

  Future<List> getdata() async {
    List todolist = await StoragePreferences().getlistData();
    print(todolist);
    return todolist;
  }

  loadData() async {
    List storedData = await getdata();
    lists.value = storedData
        .map((e) {
          if (e is Map<String, dynamic>) {
            return ListTaskList.fromJson(e);
          } else {
            return null; // or handle the case where the data is not in the expected format
          }
        })
        .where((element) => element != null)
        .map((e) => e!)
        .toList(); // Use NonNull operator to assert non-null elements
  }
}
