import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/first_controller.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  //final NewTodoListController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<FirstController>(
      builder: (controller) {
        return Scaffold(
            body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: Visibility(
                  visible: controller.lists.isNotEmpty,
                  replacement: const Center(
                      child: Text("No available lists, You can start an new day!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
                  child: GridView.builder(
                      itemCount: controller.lists.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6),
                      itemBuilder: ((context, index) {
                        return InkWell(
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
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side:
                                    BorderSide(color: Colors.deepPurple[100]!)),
                            elevation: 3,
                            shadowColor: Colors.deepPurple,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.padding_outlined),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            controller.lists[index].listName ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ...controller.lists[index].taskList
                                        .take(3)
                                        .map((e) => Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.circle,
                                                  size: 8,
                                                  color: e.priority == "High"
                                                      ? Colors.red
                                                      : e.priority == "Regular"
                                                          ? Colors.amber
                                                          : Colors.green,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "${e.taskName}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      decoration:
                                                          e.isDone == true
                                                              ? TextDecoration
                                                                  .lineThrough
                                                              : null),
                                                  //overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            )),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 14),
                                      child: Text(
                                        "...",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(controller.lists[index].taskList
                                          .where((element) =>
                                              element.isDone == false)
                                          .isNotEmpty
                                      ? "${controller.lists[index].taskList.where((element) => element.isDone == false).length} remaining tasks"
                                      : " "),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
                )),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFF5460EA),
                      borderRadius: BorderRadius.circular(40)),
                  child: TextButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025))
                          .then((value) {
                        var date = Jiffy.parseFromDateTime(value!)
                            .format(pattern: "MMM  do");

                        controller.addList(
                            ListTaskList(listName: date, taskList: <Task>[]));
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent)),
                    child: const Text(
                      "Start a new day",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: "Rubik"),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ));
      },
    ));
  }
}
