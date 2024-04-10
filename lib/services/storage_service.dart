import 'dart:convert';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoragePreferences {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void setListTaskLists(List<ListTaskList> lists) {
    final String jsonLists =
        jsonEncode(lists.map((list) => list.toJson()).toList());
    _preferences?.setString("lists", jsonLists);
    print(jsonLists);
  }

  List getlistData() {
    return jsonDecode(_preferences!.getString("lists")!) ?? [];
  }
}

































// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class StoragePreferences {
//   static SharedPreferences? preferences;

//   static Future init() async {
//     preferences = await SharedPreferences.getInstance();
//   }

//   setlistData(List lists) {
//     preferences!.setString("lists", jsonEncode(lists));
    
//   }

//   List getlistData() {
//     return jsonDecode(preferences!.getString("lists")!) ?? [];
//   }

// }


// static List<ListTaskList> getListTaskLists() {
  //   final String? jsonString = _preferences?.getString("lists");
  //   if (jsonString != null) {
  //     final List<dynamic> decoded = jsonDecode(jsonString);
  //     return decoded.map((listJson) => ListTaskList.fromJson(listJson)).toList();
  //   } else {
  //     return [];
  //   }
  // }