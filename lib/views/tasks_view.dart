import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/first_controller.dart';
import 'package:flutter_todo/controller/new_todolist_controller.dart';
import 'package:flutter_todo/controller/priority_controller.dart';
import 'package:flutter_todo/controller/time_controller.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';

class TaskView extends StatelessWidget {
  TaskView({super.key});

  final TimeController timeController = Get.find();

  final PriorityController priorityController = Get.find();

  final FirstController firstController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewTodoListController>(builder: (controller) {
      return Scaffold(
        endDrawer: SafeArea(
          child: Drawer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " Add Task",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.taskTitle.value,
                        decoration: const InputDecoration(
                          label: Text("Task"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => TextFormField(
                          decoration: InputDecoration(
                              label: const Text("Start Time"),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.watch_later_outlined),
                                onPressed: () {
                                  timeController.selectStartTime(context);
                                },
                              )),
                          readOnly: true,
                          controller: TextEditingController(
                              text: timeController.startTime.value),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => TextFormField(
                          decoration: InputDecoration(
                              label: const Text("End Time"),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  icon: const Icon(Icons.watch_later_outlined),
                                  onPressed: () {
                                    timeController.selectEndTime(context);
                                  })),
                          readOnly: true,
                          controller: TextEditingController(
                              text: timeController.endTime.value),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Priority",
                        style: (TextStyle(fontWeight: FontWeight.w600)),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Obx(
                                () => Radio(
                                    activeColor: Colors.red,
                                    value: "High",
                                    groupValue:
                                        priorityController.priority.value,
                                    onChanged: (value) {
                                      priorityController
                                          .setPriority(value.toString());
                                    }),
                              ),
                              const Text("High")
                            ],
                          ),
                          Column(
                            children: [
                              Obx(
                                () => Radio(
                                    activeColor: Colors.amber,
                                    value: "Regular",
                                    groupValue:
                                        priorityController.priority.value,
                                    onChanged: (value) {
                                      priorityController
                                          .setPriority(value.toString());
                                    }),
                              ),
                              const Text("Regular")
                            ],
                          ),
                          Column(
                            children: [
                              Obx(
                                () => Radio(
                                    activeColor: Colors.green,
                                    value: "Low",
                                    groupValue:
                                        priorityController.priority.value,
                                    onChanged: (value) {
                                      priorityController
                                          .setPriority(value.toString());
                                    }),
                              ),
                              const Text("Low")
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFF5460EA),
                            borderRadius: BorderRadius.circular(40)),
                        child: TextButton(
                          onPressed: () {
                            int startTime = int.parse(
                                timeController.startTime.value.split(":")[0]);
                            int endTime = int.parse(
                                timeController.endTime.value.split(":")[0]);

                            if (endTime >= startTime) {
                              controller.addTask(
                                Task(
                                    taskName: controller.taskTitle.value.text,
                                    startTime: timeController.startTime.value,
                                    endTime: timeController.endTime.value,
                                    priority:
                                        priorityController.priority.value),
                                controller.listNo.value,
                              );
                              firstController.loadData();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          "End time should be Greater than Start time")));
                            }

                            controller.taskTitle.value.text = " ";
                            timeController.startTime.value = "00:00 ";
                            timeController.endTime.value = "00:00 ";
                            priorityController.priority.value = "Regular";
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          child: const Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: "Rubik"),
                          ),
                        ),
                      )
                    ],
                  ),
                  ListTile(
                    title: const Text(
                      "Get Insights",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.bar_chart_outlined),
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed("/insight",
                          arguments: [controller.lists[controller.listNo.value], controller.lists]);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey[50],
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    actions: [
                      Builder(builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon: const Icon(
                                Icons.playlist_add,
                                size: 38,
                              )),
                        );
                      })
                    ],
                    automaticallyImplyLeading: false,
                    titleSpacing: 0,
                    stretch: false,
                    toolbarHeight: 70,
                    pinned: true,
                    elevation: 0,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blueGrey[50],
                    leading: GestureDetector(
                        onTap: () {
                          Get.toNamed("/timeRange");
                        },
                        child: Image.asset(
                          "lib/assets/icons/leading.png",
                          scale: 15,
                          width: 5,
                        )),
                    title: Text(
                      "${controller.lists[controller.listNo.value].listName}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 26),
                    ),
                  ),
                  SliverList.builder(
                      itemCount: controller.lists[controller.listNo.value].taskList.length,
                      itemBuilder: ((context, index) {
                        firstController.getdata();
                        Task task = controller.lists[controller.listNo.value].taskList[index];
                        
                        // Task task = controller.title.value.taskList[index];

                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: SizedBox(
                            height: 110,
                            child: GestureDetector(
                              onTap: () {
                                controller.isSelected(index);
                              },
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                          title: const Text("Delete Task"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  controller.deleteTask(
                                                      Task(id: task.id),
                                                      controller.listNo.value);
                                                  Navigator.pop(context);
                                                  firstController.loadData();
                                                },
                                                child: const Text("Delete"))
                                          ],
                                        )));
                              },
                              child: Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: controller.selected.value ==
                                                        index &&
                                                    controller.active.value ==
                                                        true
                                                ? const Color(0xFF5460EA)
                                                : Colors.transparent,
                                            width: 2.0)),
                                    color: Colors.white,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(
                                          () => Container(
                                            margin: const EdgeInsets.all(14),
                                            height: controller.selected.value ==
                                                        index &&
                                                    controller.active.value ==
                                                        true
                                                ? 100
                                                : 25,
                                            width: 4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: task.isDone == true
                                                    ? Colors.grey[400]
                                                    : const Color(0xFF5460EA)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16,
                                                            left: 6,
                                                            right: 8,
                                                            bottom: 6),
                                                    child: Text(
                                                        "${task.startTime ?? " "} - ${task.endTime ?? " "}",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: task.isDone ==
                                                                  true
                                                              ? Colors.grey[400]
                                                              : Colors.black87,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                      size: 10,
                                                      Icons.circle,
                                                      color: task.isDone == true
                                                          ? Colors.grey[400]
                                                          : controller
                                                                      .title
                                                                      .value
                                                                      .taskList[
                                                                          index]
                                                                      .priority ==
                                                                  "High"
                                                              ? Colors.red
                                                              : controller
                                                                          .title
                                                                          .value
                                                                          .taskList[
                                                                              index]
                                                                          .priority ==
                                                                      "Regular"
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .green),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${task.taskName}",
                                                      style: TextStyle(
                                                          color: task.isDone ==
                                                                  true
                                                              ? Colors.grey[400]
                                                              : null,
                                                          fontSize: controller
                                                                          .selected
                                                                          .value ==
                                                                      index &&
                                                                  controller
                                                                          .active
                                                                          .value ==
                                                                      true
                                                              ? 18
                                                              : 18,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                      overflow:
                                                          TextOverflow.visible,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: controller.selected.value !=
                                              index,
                                          child: Checkbox(
                                              side: const BorderSide(
                                                  color: Color(0xFF9597F3),
                                                  width: 2),
                                              activeColor:
                                                  const Color(0xFF5460EA),
                                              shape: const CircleBorder(),
                                              value: task.isDone,
                                              onChanged: (value) {
                                                controller.toggleCheckbox(task);
                                                firstController.loadData();
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 27,
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  onPressed: () {
                    //Get.back();
                    if (controller.title.value.taskList.isNotEmpty) {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text("Delete All"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      controller.clearList();
                                      firstController.loadData();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Confirm"))
                              ],
                            );
                          }));
                    }
                  },
                  icon: Center(
                      child: Image.asset(
                    "lib/assets/icons/delete.png",
                    color: Colors.white,
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      );
    });
  }
}
