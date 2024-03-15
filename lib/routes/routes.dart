import 'package:get/route_manager.dart';
import 'package:flutter_todo/bindings/newlist_binding.dart';
import 'package:flutter_todo/views/home_view.dart';
import 'package:flutter_todo/views/tasks_view.dart';

class Routes {
  static final routes = [
    GetPage(name: "/home", binding: NewlistBinding(), page: () => HomeView()),
    GetPage(name: "/taskView", page: () => TaskView()),
  ];
}
