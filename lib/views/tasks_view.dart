import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/new_todolist_controller.dart';
import 'package:flutter_todo/controller/priority_controller.dart';
import 'package:flutter_todo/controller/time_controller.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    ListTaskList title =
        data[0] ?? ListTaskList(listName: "list", taskList: []);
    int listNo = data[1];
    List<String> times = [
      " ",
      "+",
      "8",
      "8.5",
      "9",
      "9.5",
      "10",
      "10.5",
      "11",
      "11.5",
      "12",
      "12.5",
      "13",
      "13.5",
      "14",
      "14.5",
      "15",
      "15.5",
      "16",
      "16.5",
      "17",
      "17.5",
      "18",
      "18.5",
      "19",
      "19.5",
      "20",
      "20.5",
      "21",
      "21.5",
      "22",
      "22.5",
      "23",
      "23.5"
    ];

    //Task hTask = title.taskList[0];
    final TimeController timeController = Get.find();

    final PriorityController priorityController = Get.find();

    return GetBuilder<NewTodoListController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.blueGrey[50],
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      stretch: false,
                      toolbarHeight: 70,
                      pinned: true,
                      elevation: 0,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blueGrey[50],
                      expandedHeight:
                          MediaQuery.of(context).size.height / 1.5, //550,
                      leading: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 36,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${title.listName}",
                            style: const TextStyle(
                                color: Colors.black,
                                //fontFamily: "MonaSans",
                                fontWeight: FontWeight.w900,
                                fontSize: 26),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.taskTitle.value.text = "Drink Water";
                              timeController.startTime.value = "";
                              timeController.endTime.value = "";
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        scrollable: true,
                                        backgroundColor: Colors.grey[100],
                                        title: const Text(
                                          "Add Task",
                                          style: TextStyle(
                                              color: Color(0xFF5460EA)),
                                        ),
                                        content: Column(
                                          children: [
                                            TextField(
                                              controller:controller.taskTitle.value ,
                                              decoration: const InputDecoration(
                                                label: Text("Task"),
                                                border: OutlineInputBorder(),
                                              ),
                                              
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Obx(
                                              () => TextField(
                                                decoration: InputDecoration(
                                                    label: const Text(
                                                        "Start Time"),
                                                    border:
                                                        const OutlineInputBorder(),
                                                    suffixIcon: IconButton(
                                                      icon: const Icon(Icons
                                                          .watch_later_outlined),
                                                      onPressed: () {
                                                        timeController
                                                            .selectStartTime(
                                                                context);
                                                      },
                                                    )),
                                                readOnly: true,
                                                controller:
                                                    TextEditingController(
                                                        text: timeController
                                                            .startTime.value),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10
                                            ),
                                            Obx(
                                              () => TextField(
                                                decoration: InputDecoration(
                                                    label:
                                                        const Text("End Time"),
                                                    border:
                                                        const OutlineInputBorder(),
                                                    suffixIcon: IconButton(
                                                      icon: const Icon(Icons
                                                          .watch_later_outlined),
                                                      onPressed: () {
                                                        timeController
                                                            .selectEndTime(
                                                                context);
                                                      },
                                                    )),
                                                readOnly: true,
                                                controller:
                                                    TextEditingController(
                                                        text: timeController
                                                            .endTime.value),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Priority",
                                              style: (TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  children: [
                                                    Obx(
                                                      () => Radio(
                                                          activeColor:
                                                              Colors.red,
                                                          value: "High",
                                                          groupValue:
                                                              priorityController
                                                                  .priority
                                                                  .value,
                                                          onChanged: (value) {
                                                            priorityController
                                                                .setPriority(value
                                                                    .toString());
                                                          }),
                                                    ),
                                                    const Text("High")
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Obx(
                                                      () => Radio(
                                                          activeColor:
                                                              Colors.amber,
                                                          value: "Regular",
                                                          groupValue:
                                                              priorityController
                                                                  .priority
                                                                  .value,
                                                          onChanged: (value) {
                                                            priorityController
                                                                .setPriority(value
                                                                    .toString());
                                                          }),
                                                    ),
                                                    const Text("Regular")
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Obx(
                                                      () => Radio(
                                                          activeColor:
                                                              Colors.green,
                                                          value: "Low",
                                                          groupValue:
                                                              priorityController
                                                                  .priority
                                                                  .value,
                                                          onChanged: (value) {
                                                            priorityController
                                                                .setPriority(value
                                                                    .toString());
                                                          }),
                                                    ),
                                                    const Text("Low")
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              controller.addTask(
                                                Task(
                                                    taskName: controller.taskTitle.value.text,
                                                    startTime: timeController
                                                        .startTime.value,
                                                    endTime: timeController
                                                        .endTime.value,
                                                    priority: priorityController
                                                        .priority.value),
                                                listNo,
                                              );
                                              timeController.startTime.value =
                                                  " ";
                                              timeController.endTime.value =
                                                  " ";
                                              priorityController
                                                  .priority.value = "Regular";
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Color(0xFF023E8A)),
                                            ),
                                          )
                                        ],
                                      ));
                            },
                            child: const Icon(
                              Icons.playlist_add_rounded,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                      flexibleSpace: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: GridView.builder(
                                cacheExtent: 0,
                                padding: const EdgeInsets.only(
                                    top: 110, left: 10, right: 10),
                                itemCount: times.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 0,
                                        crossAxisSpacing: 0,
                                        crossAxisCount: 7),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      timeController.selectRange(times[index]);
                                      // timeController.range.value =
                                      //     times.sublist(
                                      //         times.indexOf(timeController
                                      //                 .time1.value) +
                                      //             1,
                                      //         times.indexOf(
                                      //             timeController.time2.value));
                                      // // if(timeController.time1.value != 'x' && timeController.time2.value != 'x'  ){
                                      // timeController.range.value =
                                      //     times.sublist(
                                      //         times.indexOf(timeController
                                      //                 .time1.value) +
                                      //             1,
                                      //         times.indexOf(
                                      //             timeController.time2.value));
                                      // }
                                      //print(times[index]);
                                    },
                                    child: Obx(
                                      () => Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: timeController.range
                                                    .contains(times[index])
                                                ? 5
                                                : 0),
                                        decoration: BoxDecoration(
                                            color: timeController.range
                                                    .contains(times[index])
                                                ? const Color(0xFF5460EA)
                                                : null,
                                            border: Border.all(
                                                width: 3,
                                                color: timeController
                                                            .time1.value ==
                                                        times[index]
                                                    ? const Color(0xFF5460EA)
                                                    : timeController
                                                                .time2.value ==
                                                            times[index]
                                                        ? const Color(
                                                            0xFF5460EA)
                                                        : Colors.transparent)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: timeController.time1.value ==
                                                        times[index] ||
                                                    timeController
                                                            .time2.value ==
                                                        times[index]
                                                ? BoxShape.circle
                                                : BoxShape.rectangle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              times[index].contains(".5")
                                                  ? ".5"
                                                  : times[index],
                                              style: TextStyle(
                                                  color: timeController.range
                                                          .contains(
                                                              times[index])
                                                      ? Colors.white
                                                      : null,
                                                  fontWeight: timeController
                                                                  .time1
                                                                  .value ==
                                                              times[index] ||
                                                          timeController.time2
                                                                  .value ==
                                                              times[index]
                                                      ? FontWeight.w900
                                                      : null,
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          //timeController.getCard(title)?
                          true
                              ? Expanded(
                                  child: Container(
                                  margin: const EdgeInsets.all(15),
                                  height: 110,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Column(
                                    children: [Text("hi")],
                                  ),
                                ))
                              : const Text(
                                  "Select a time range to find your tasks")
                        ],
                      ),
                    ),
                    SliverList.builder(
                        itemCount: title.taskList.length,
                        itemBuilder: ((context, index) {
                          Task task = title.taskList[index];

                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: SizedBox(
                              // width: double.maxFinite,
                              height: 110,
                              // padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  controller.isSelected(index);
                                  //controller.isActive();
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
                                                        listNo);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Delete"))
                                            ],
                                          )));
                                },
                                child: Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Card(
                                      //margin: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                              color: controller
                                                              .selected.value ==
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
                                              height: controller
                                                              .selected.value ==
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
                                                      : const Color(
                                                          0xFF5460EA)),
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
                                                            fontSize: 16,
                                                            fontFamily: "Mona",
                                                            color: task.isDone ==
                                                                    true
                                                                ? Colors
                                                                    .grey[400]
                                                                : Colors
                                                                    .black87,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Icon(
                                                        size: 10,
                                                        Icons.circle,
                                                        color: task.isDone ==
                                                                true
                                                            ? Colors.grey[400]
                                                            : title
                                                                        .taskList[
                                                                            index]
                                                                        .priority ==
                                                                    "High"
                                                                ? Colors.red
                                                                : title.taskList[index].priority ==
                                                                        "Regular"
                                                                    ? Colors
                                                                        .amber
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
                                                                ? Colors
                                                                    .grey[400]
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
                                                                FontWeight
                                                                    .w900),
                                                        overflow: TextOverflow
                                                            .visible,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                controller.selected.value !=
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
                                                  controller
                                                      .toggleCheckbox(task);
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
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: IconButton(
                    onPressed: () {
                      //Get.back();
                      if (controller.lists[listNo].taskList.isNotEmpty) {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text("Delete All"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        controller.clearList(listNo);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Conform"))
                                ],
                              );
                            }));
                      }
                    },
                    icon: const Center(
                      child: Icon(
                        Icons.delete_outlined,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ));
    });
  }
}
