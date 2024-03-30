import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/insights_controller.dart';
import 'package:flutter_todo/views/tasks_view.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';

class InsightView extends StatelessWidget {
  InsightView({super.key});

  final InsightsController nc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.off(TaskView());
            },
            child: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: FlutterToggleTab(
            isScroll: false,
            height: 35,
            width: 65,
            selectedBackgroundColors: [Color(0xFF5460EA)],
            unSelectedBackgroundColors: [Colors.white],
            unSelectedTextStyle:
                const TextStyle(color: Colors.black, fontSize: 16),
            selectedTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            labels: const ["Day", "Week", "Month"],
            selectedLabelIndex: (index) {
              
            },
            selectedIndex: 0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: ListView(
          semanticChildCount: 3,
          children: [
            ListTile(
              title: Text(
                nc.heading,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                height: 160,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(" 0.00 "),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: index < nc.q1.length &&
                                          nc.q1[index].isDone == true &&
                                          nc.q1[index].priority == "High"
                                      ? Colors.red[100]
                                      : index < nc.q1.length &&
                                              nc.q1[index].isDone == true &&
                                              nc.q1[index].priority == "Low"
                                          ? Colors.green[100]
                                          : index < nc.q1.length &&
                                                  nc.q1[index].isDone == true &&
                                                  nc.q1[index].priority ==
                                                      "Regular"
                                              ? Colors.amber[100]
                                              : Colors.grey[100],
                                );
                              }),
                        ),
                        const Text(" 6:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(" 6.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: index < nc.q2.length &&
                                          nc.q2[index].isDone == true &&
                                          nc.q2[index].priority == "High"
                                      ? Colors.red[100]
                                      : index < nc.q2.length &&
                                              nc.q2[index].isDone == true &&
                                              nc.q2[index].priority == "Low"
                                          ? Colors.green[100]
                                          : index < nc.q2.length &&
                                                  nc.q2[index].isDone == true &&
                                                  nc.q2[index].priority ==
                                                      "Regular"
                                              ? Colors.amber[100]
                                              : Colors.grey[100],
                                );
                              }),
                        ),
                        const Text("12:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("12.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: index < nc.q3.length &&
                                          nc.q3[index].isDone == true &&
                                          nc.q3[index].priority == "High"
                                      ? Colors.red[100]
                                      : index < nc.q3.length &&
                                              nc.q3[index].isDone == true &&
                                              nc.q3[index].priority == "Low"
                                          ? Colors.green[100]
                                          : index < nc.q3.length &&
                                                  nc.q3[index].isDone == true &&
                                                  nc.q3[index].priority ==
                                                      "Regular"
                                              ? Colors.amber[100]
                                              : Colors.grey[100],
                                );
                              }),
                        ),
                        const Text("18:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("18.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: index < nc.q4.length &&
                                          nc.q4[index].isDone == true &&
                                          nc.q4[index].priority == "High"
                                      ? Colors.red[100]
                                      : index < nc.q4.length &&
                                              nc.q4[index].isDone == true &&
                                              nc.q4[index].priority == "Low"
                                          ? Colors.green[100]
                                          : index < nc.q4.length &&
                                                  nc.q4[index].isDone == true &&
                                                  nc.q4[index].priority ==
                                                      "Regular"
                                              ? Colors.amber[100]
                                              : Colors.grey[100],
                                );
                              }),
                        ),
                        const Text(" 0:00")
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.radio_button_off,
                    size: 10,
                    weight: 100,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(text: "You've done "),
                            TextSpan(
                                text: "${nc.count.toString()} tasks ",
                                style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(text: "today and focused on "),
                            TextSpan(
                                text: "${nc.hrs.toString()} hours",
                                style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                "Yesterday",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                height: 160,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(" 0.00 "),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.grey[100],
                                );
                              }),
                        ),
                        const Text(" 6:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(" 6.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.grey[100],
                                );
                              }),
                        ),
                        const Text("12:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("12.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.grey[100],
                                );
                              }),
                        ),
                        const Text("18:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("18.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.grey[100],
                                );
                              }),
                        ),
                        const Text(" 0:00")
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Anyday",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                height: 160,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(" 0.00 "),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.grey[100],
                                );
                              }),
                        ),
                        const Text(" 6:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(" 6.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.grey[100],
                                );
                              }),
                        ),
                        const Text("12:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("12.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12,
                                      crossAxisSpacing: 0.5),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                    elevation: 0,
                                    color: index % 2 == 0
                                        ? Colors.green[100]
                                        : Colors.grey[100]);
                              }),
                        ),
                        const Text("18:00")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text("18.00"),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.grey[100],
                                );
                              }),
                        ),
                        const Text(" 0:00")
                      ],
                    )
                  ],
                ),
              ),
            ),
            const ListTile(
              subtitle: Center(child: Text("See more")),
            )
          ],
        ),
      ),
    );
  }
}
