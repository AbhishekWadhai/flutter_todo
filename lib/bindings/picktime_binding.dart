import 'package:flutter_todo/controller/time_controller.dart';
import 'package:get/get.dart';
class PickTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( TimeController());
  }
}
