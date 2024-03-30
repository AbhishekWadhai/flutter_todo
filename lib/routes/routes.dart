import 'package:flutter_todo/bindings/first_binding.dart';
import 'package:flutter_todo/bindings/insights_binding.dart';
import 'package:flutter_todo/bindings/newlist_binding.dart';
import 'package:flutter_todo/bindings/picktime_binding.dart';
import 'package:flutter_todo/bindings/priority_binding.dart';
import 'package:flutter_todo/views/home_view.dart';
import 'package:flutter_todo/views/insight_view.dart';
import 'package:flutter_todo/views/tasks_view.dart';
import 'package:flutter_todo/views/time_range_view.dart';
import 'package:get/route_manager.dart';

class Routes {
  static final routes = [
    GetPage(name: "/home", binding: FirstBinding(), page: () => HomeView()),
    GetPage(
        name: "/taskView",
        bindings: [NewlistBinding(), PickTimeBinding(), PriorityBinding()],
        page: () => TaskView()),
    GetPage(name: "/timeRange", page: () => TimeRange()),
    GetPage(
        name: "/insight", binding: InsightBindings(), page: () => InsightView())
  ];
}
