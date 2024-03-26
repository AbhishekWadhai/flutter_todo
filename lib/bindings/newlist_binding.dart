import 'package:flutter_todo/controller/new_todolist_controller.dart';
import 'package:get/get.dart';
class NewlistBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewTodoListController());
  }

}