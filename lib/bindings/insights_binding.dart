
import 'package:flutter_todo/controller/insights_controller.dart';
import 'package:get/get.dart';

class InsightBindings extends Bindings {
  @override
  void dependencies() {
    Get.put( InsightsController());
  }
}
