import 'package:flutter_todo/bindings/newlist_binding.dart';
import 'package:flutter_todo/bindings/picktime_binding.dart';
import 'package:flutter_todo/bindings/priority_binding.dart';
import 'package:flutter_todo/views/home_view.dart';
import 'package:flutter_todo/views/tasks_view.dart';
import 'package:get/route_manager.dart';
class Routes {
  static final routes = [
    GetPage(name: "/home", binding: NewlistBinding(), page: () => HomeView()),
    GetPage(
        name: "/taskView",
        bindings: [PickTimeBinding(), PriorityBinding()],
        page: () => TaskView()),
  ];
}
