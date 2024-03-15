import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_todo/controller/new_todolist_controller.dart';
import 'package:flutter_todo/model/list_task_list.dart';
import 'package:flutter_todo/model/task.dart';

class TaskView extends StatelessWidget {
  //const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    String taskTitle = 'Drink water';
    //bool? isChecked = false;
    final data = Get.arguments;
    ListTaskList title = data[0];
    int listNo = data[1];

    return GetBuilder<NewTodoListController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey[200],
            toolbarHeight: 100,
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
                      fontWeight: FontWeight.w600, fontSize: 26),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Colors.grey[100],
                              title: const Text(
                                "Add Task",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                              content: Column(
                                
                                children: [
                                  TextField(
                                    decoration:const  InputDecoration(
                                      label: Text("Task"),
                                      border: OutlineInputBorder(),
                                      
                                    ),
                                    onChanged: (value) {
                                      taskTitle = value;
                                    },
                                    
                                  ),
                                  const SizedBox(height: 10,),
                                  TextField(
                                    decoration:  InputDecoration(
                                      label: Text("Start Time"),
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(icon: Icon(Icons.watch_later_outlined),
                                      onPressed: (){
 showTimePicker(context: context, initialTime: TimeOfDay.now());
                                      },)
                                    ),
                                    onChanged: (value) {
                                      taskTitle = value;
                                    },
                                  ),
                                  const SizedBox(height: 10,),
                                  TextField(
                                    decoration:const  InputDecoration(
                                      label: Text("End Time"),
                                      border: OutlineInputBorder(),
                                      suffixIcon: IconButton(icon: Icon(Icons.watch_later_outlined),
                                      onPressed: null,)
                                    ),
                                    onChanged: (value) {
                                      taskTitle = value;
                                    },
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    controller.addTask(
                                        Task(
                                            //isDone: isChecked,
                                            taskName: "$taskTitle"),
                                        listNo);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(color: Color(0xFF023E8A)),
                                  ),
                                )
                              ],
                            ));
                  },
                  child: const Icon(
                    Icons.playlist_add,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: title.taskList.length,
                      itemBuilder: ((context, index) {
                        Task task = title.taskList[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0),
                          child: SizedBox(
                            height: 100,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              color: Colors.white,
                              shadowColor: Colors.blue[900],
                              elevation: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                      trailing: Checkbox(
                                          shape: const CircleBorder(),
                                          value: task.isDone,
                                          onChanged: (value) {
                                            controller.toggleCheckbox(
                                                task, listNo);
                                          }),
                                      leading: const Text("12:30 PM - 2:30 PM",
                                          style: TextStyle(fontSize: 14)),
                                      onLongPress: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: const Text(
                                                      "Delete this list"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          controller.deleteTask(
                                                              Task(
                                                                  //isDone: isChecked,
                                                                  taskName:
                                                                      "$taskTitle"),
                                                              listNo);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            "Delete"))
                                                  ],
                                                ));
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "${title.taskList[index].taskName}",
                                      style: TextStyle(
                                          decoration: task.isDone == true
                                              ? TextDecoration.lineThrough
                                              : null,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    onPressed: () {},
                    child: const Icon(Icons.delete_outline_outlined)),
              )
            ],
          ));
    });
  }
}
