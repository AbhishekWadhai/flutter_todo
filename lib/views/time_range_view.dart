import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/first_controller.dart';
import 'package:flutter_todo/controller/new_todolist_controller.dart';
import 'package:flutter_todo/controller/time_controller.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class TimeRange extends StatelessWidget {
  TimeRange({super.key});

  final FirstController controller1 = Get.find();
  final NewTodoListController controller = Get.find();
  final TimeController timeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.offNamed("/taskView");
            timeController.time1.value = 'x';
            timeController.time2.value = 'x';
            timeController.range!.clear();
          },
          child: const Icon(
            Icons.keyboard_arrow_down,
            size: 36,
          ),
        ),
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.title.value.listName!,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.menu,
                size: 36,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: GridView.builder(
                cacheExtent: 0,
                padding: const EdgeInsets.all(8),
                itemCount: timeController.times.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0, crossAxisSpacing: 0, crossAxisCount: 7),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      timeController.selectRange(
                          timeController.times[index], controller.title.value);
                    },
                    child: Obx(
                      () => Container(
                        margin: EdgeInsets.symmetric(
                            vertical: timeController.range!
                                    .contains(timeController.times[index])
                                ? 5
                                : 0),
                        decoration: BoxDecoration(
                          
                          gradient: timeController.time1.value ==
                                  timeController.times[index]
                              ? const LinearGradient(
                                  colors: [Colors.white, Color(0xFF5460EA)],
                                  stops: [0.5, 0.5])
                              : timeController.time2.value ==
                                      timeController.times[index]
                                  ? const LinearGradient(
                                      colors: [Color(0xFF5460EA), Colors.white],
                                      stops: [0.5, 0.5])
                                  : null,
                          color: timeController.time1.value ==
                                      timeController.times[index] ||
                                  timeController.time2.value ==
                                      timeController.times[index]
                              ? Colors.white
                              : timeController.range!
                                      .contains(timeController.times[index])
                                  ? const Color(0xFF5460EA)
                                  : null,
                        ),
                        child: Center(
                          child: timeController.times[index] == "+"
                              ? Icon(
                                  Icons.add_circle_sharp,
                                  color: Colors.grey[300],
                                )
                              : CircleAvatar(
                                radius: 20,
                                backgroundColor: timeController.time1.value ==
                                                timeController.times[index] ||
                                            timeController.time2.value ==
                                                timeController.times[index]?Colors.deepPurple: Colors.transparent,
                                child: CircleAvatar(
                                  radius: 18,
                                    backgroundColor: timeController.time1.value ==
                                                timeController.times[index] ||
                                            timeController.time2.value ==
                                                timeController.times[index]
                                        ? Colors.white
                                        : Colors.transparent,
                                    child: Text(
                                      timeController.times[index].contains(":30")
                                          ? ".5"
                                          : timeController.times[index]
                                              .split(":")[0]
                                              .replaceAll(RegExp('^0+'), ''),
                                      style: TextStyle(
                                          color: timeController.time1.value ==
                                                      timeController
                                                          .times[index] ||
                                                  timeController.time2.value ==
                                                      timeController.times[index]
                                              ? Colors.black
                                              : timeController.range!.contains(
                                                      timeController.times[index])
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight: timeController
                                                          .time1.value ==
                                                      timeController
                                                          .times[index] ||
                                                  timeController.time2.value ==
                                                      timeController.times[index]
                                              ? FontWeight.w900
                                              : null,
                                          fontSize: 17),
                                    ),
                                  ),
                              ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          GetBuilder<TimeController>(builder: (timeController) {
            return timeController.cardTask(controller.title.value)
                ? Card(
                  color: Colors.grey[100],
                    margin: const EdgeInsets.all(10),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SizedBox(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 15),
                                  child: Obx(
                                    () => Text(
                                        "${timeController.hTask.value.startTime}-${timeController.hTask.value.endTime}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [Colors.amber, Colors.orange],
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 25,
                                      color: Colors.white,
                                      weight: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.blueAccent,
                                  child: null,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.green,
                                  child: timeController.hTask.value.priority ==
                                          "Low"
                                      ? const Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.amber,
                                  child: timeController.hTask.value.priority ==
                                          "Regular"
                                      ? const Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.red,
                                  child: timeController.hTask.value.priority ==
                                          "High"
                                      ? const Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        )
                                      : null, //Icon(Icons.check, size: 14,),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                //
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  timeController.hTask.value.taskName ?? " ",
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  " l",
                                  style: TextStyle(
                                      color: Color(0xFF5460EA),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Card(
                  color: Colors.grey[50],
                    margin: const EdgeInsets.all(10),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25, top: 15),
                      child: SizedBox(
                        height: 140,
                        child:  Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "No pending task in selected time...",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.visible),
                              ),
                              Text(
                                " !",
                                style: TextStyle(
                                    color: Color(0xFF5460EA),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          }),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: controller.title.value.taskList.length,
                  itemBuilder: (context, index) {
                    Task task = controller.title.value.taskList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, left: 6, right: 8, bottom: 6),
                                  child: Text(
                                      "${task.startTime ?? " "} - ${task.endTime ?? " "}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: task.isDone == true
                                            ? Colors.grey[400]
                                            : Colors.black87,
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
                                    color: task.isDone == true
                                        ? Colors.grey[400]
                                        : controller.title.value.taskList[index]
                                                    .priority ==
                                                "High"
                                            ? Colors.red
                                            : controller
                                                        .title
                                                        .value
                                                        .taskList[index]
                                                        .priority ==
                                                    "Regular"
                                                ? Colors.amber
                                                : Colors.green),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "${task.taskName}",
                                    style: TextStyle(
                                        color: task.isDone == true
                                            ? Colors.grey[400]
                                            : null,
                                        fontSize: controller.selected.value ==
                                                    index &&
                                                controller.active.value == true
                                            ? 18
                                            : 18,
                                        fontWeight: FontWeight.w900),
                                    overflow: TextOverflow.visible,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
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
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025))
                    .then((value) {
                  var date = Jiffy.parseFromDateTime(value!)
                      .format(pattern: "MMM  do");

                  controller1.addList(
                      ListTaskList(listName: date, taskList: <Task>[]));
                  Get.offNamed("/home");
                });
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent)),
              child: const Text(
                "Start a new day",
                style: TextStyle(
                    color: Colors.white, fontSize: 20.0, fontFamily: "Rubik"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
