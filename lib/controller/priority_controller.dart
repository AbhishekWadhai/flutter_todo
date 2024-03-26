import 'package:get/get.dart';

class PriorityController extends GetxController {
  RxString priority = "Regular".obs;
  setPriority(String prior) {
    priority.value = prior;
  }
}


