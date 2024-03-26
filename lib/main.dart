import 'package:flutter/material.dart';
import 'package:flutter_todo/routes/routes.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Geo",
      ),
      getPages: Routes.routes,
      initialRoute: "/home",
    );
  }
}
