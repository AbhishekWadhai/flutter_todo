import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_todo/controller/new_todolist_controller.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';

class HomeView extends StatelessWidget {
  //const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final NewTodoListController controller = Get.find();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // const Text(
          //   "Todo",
          // ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: controller.lists.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.grey[200],
                          title: Text("${controller.lists[index].listName}"),
                          subtitle: Text("${controller.lists[index].taskList.length} Tasks"),
                          trailing: const Icon(Icons.format_list_bulleted_sharp),
                          onTap: () {
                            Get.toNamed("/taskView",
                                arguments: [controller.lists[index], index]);
                          },
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("Delete this list"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              controller.deleteList(
                                                  controller.lists[index]);
                                              Get.back();
                                            },
                                            child: const Text("Delete"))
                                      ],
                                    ));
                          },
                        ),
                      ),
                    );
                  })),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(40)),
            child: TextButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025))
                    .then((value) {
                  var date = DateFormat.yMMMd().format(value!).toString();
                  controller.addList(
                      ListTaskList(listName: date, taskList: <Task>[]));
                });
              },
              child: const Text(
                "Start a new day",
                style: TextStyle(
                    color: Colors.white, fontSize: 20.0, fontFamily: "Rubik"),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
























// showModalBottomSheet(
//                             backgroundColor: const Color(0xFFADE8F4),
//                             context: context,
//                             builder: (context) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(30.0),
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             color: Colors.grey[300],
//                                             borderRadius:
//                                                 BorderRadius.circular(20)),
//                                         child: TextField(
//                                           textAlign: TextAlign.center,
//                                           decoration: const InputDecoration(
//                                             border: InputBorder.none,
//                                             hintText: "List Name",
//                                           ),
//                                           onChanged: (value) {
//                                             listName = value;
//                                           },
//                                         )),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                           color: const Color(0xFF03045E),
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                       child: TextButton(
//                                           onPressed: () {
//                                             controller.addList(ListTaskList(
//                                               listName: listName,
//                                               taskList: <Task>[],
//                                             ));
//                                             Navigator.pop(context);
//                                           },
//                                           child: const Text(
//                                             "Add",
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           )),
//                                     )
//                                   ],
//                                 ),
//                               );
//                             });
//                       },
//                       child: const Text(
//                         "add new TO DO list",
//                         style: TextStyle(fontSize: 20, color: Colors.white),
//                       ))),