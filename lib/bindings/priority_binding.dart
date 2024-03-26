import 'package:flutter_todo/controller/priority_controller.dart';
import 'package:get/get.dart';
class PriorityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PriorityController());
  }
}
