import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/insights_controller.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';

class InsightView extends StatelessWidget {
  InsightView({super.key});

  final InsightsController nc = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              labels: const ["Day", "Week", "Month"],
              selectedLabelIndex: (index) {},
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
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                    color: index < nc.tq1.length &&
                                            nc.tq1[index].isDone == true &&
                                            nc.tq1[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.tq1.length &&
                                                nc.tq1[index].isDone == true &&
                                                nc.tq1[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.tq1.length &&
                                                    nc.tq1[index].isDone ==
                                                        true &&
                                                    nc.tq1[index].priority ==
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
                                    color: index < nc.tq2.length &&
                                            nc.tq2[index].isDone == true &&
                                            nc.tq2[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.tq2.length &&
                                                nc.tq2[index].isDone == true &&
                                                nc.tq2[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.tq2.length &&
                                                    nc.tq2[index].isDone ==
                                                        true &&
                                                    nc.tq2[index].priority ==
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
                                    color: index < nc.tq3.length &&
                                            nc.tq3[index].isDone == true &&
                                            nc.tq3[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.tq3.length &&
                                                nc.tq3[index].isDone == true &&
                                                nc.tq3[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.tq3.length &&
                                                    nc.tq3[index].isDone ==
                                                        true &&
                                                    nc.tq3[index].priority ==
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
                                    color: index < nc.tq4.length &&
                                            nc.tq4[index].isDone == true &&
                                            nc.tq4[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.tq4.length &&
                                                nc.tq4[index].isDone == true &&
                                                nc.tq4[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.tq4.length &&
                                                    nc.tq4[index].isDone ==
                                                        true &&
                                                    nc.tq4[index].priority ==
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

//yesterday              
              ListTile(
                title: Text(
                  nc.heading2,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                    color: index < nc.yq1.length &&
                                            nc.yq1[index].isDone == true &&
                                            nc.yq1[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.yq1.length &&
                                                nc.yq1[index].isDone == true &&
                                                nc.yq1[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.yq1.length &&
                                                    nc.yq1[index].isDone ==
                                                        true &&
                                                    nc.yq1[index].priority ==
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
                                    color: index < nc.yq2.length &&
                                            nc.yq2[index].isDone == true &&
                                            nc.yq2[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.yq2.length &&
                                                nc.yq2[index].isDone == true &&
                                                nc.yq2[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.yq2.length &&
                                                    nc.yq2[index].isDone ==
                                                        true &&
                                                    nc.yq2[index].priority ==
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
                                    color: index < nc.yq3.length &&
                                            nc.yq3[index].isDone == true &&
                                            nc.yq3[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.yq3.length &&
                                                nc.yq3[index].isDone == true &&
                                                nc.yq3[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.yq3.length &&
                                                    nc.yq3[index].isDone ==
                                                        true &&
                                                    nc.yq3[index].priority ==
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
                                    color: index < nc.yq4.length &&
                                            nc.yq4[index].isDone == true &&
                                            nc.yq4[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.yq4.length &&
                                                nc.yq4[index].isDone == true &&
                                                nc.yq4[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.yq4.length &&
                                                    nc.yq4[index].isDone ==
                                                        true &&
                                                    nc.yq4[index].priority ==
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

 //anyday             
              ListTile(
                title: Text(
                  nc.heading3,
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
                                    color: index < nc.aq1.length &&
                                            nc.aq1[index].isDone == true &&
                                            nc.aq1[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.aq1.length &&
                                                nc.aq1[index].isDone == true &&
                                                nc.aq1[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.aq1.length &&
                                                    nc.aq1[index].isDone ==
                                                        true &&
                                                    nc.aq1[index].priority ==
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
                                    color: index < nc.aq2.length &&
                                            nc.aq2[index].isDone == true &&
                                            nc.aq2[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.aq2.length &&
                                                nc.aq2[index].isDone == true &&
                                                nc.aq2[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.aq2.length &&
                                                    nc.aq2[index].isDone ==
                                                        true &&
                                                    nc.aq2[index].priority ==
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
                                    color: index < nc.aq3.length &&
                                            nc.aq3[index].isDone == true &&
                                            nc.aq3[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.aq3.length &&
                                                nc.aq3[index].isDone == true &&
                                                nc.aq3[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.aq3.length &&
                                                    nc.aq3[index].isDone ==
                                                        true &&
                                                    nc.aq3[index].priority ==
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
                                    color: index < nc.aq4.length &&
                                            nc.aq4[index].isDone == true &&
                                            nc.aq4[index].priority == "High"
                                        ? Colors.red[100]
                                        : index < nc.aq4.length &&
                                                nc.aq4[index].isDone == true &&
                                                nc.aq4[index].priority == "Low"
                                            ? Colors.green[100]
                                            : index < nc.aq4.length &&
                                                    nc.aq4[index].isDone ==
                                                        true &&
                                                    nc.aq4[index].priority ==
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
              const ListTile(
                subtitle: Center(child: Text("See more")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
