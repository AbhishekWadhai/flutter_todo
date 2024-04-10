import 'package:flutter/material.dart';
import 'package:flutter_todo/routes/routes.dart';
import 'package:flutter_todo/services/storage_service.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StoragePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Plus",
      ),
      getPages: Routes.routes,
      initialRoute: "/home",
    );
  }
}
