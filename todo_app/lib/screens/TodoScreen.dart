import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final taskController = TextEditingController();

  List<Map<String, dynamic>> taskList = [];

  void addTask(BuildContext context) {
    setState(() {
      taskList.add({"taskname": taskController.text, "isDone": false});
    });

    taskController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Task Added."), backgroundColor: Colors.green),
    );

    // print(taskList);
  }

  void updateTaskStatus(index) {
    setState(() {
      taskList[index]["isDone"] = !taskList[index]["isDone"] ;
    });
  }

  void deleteTask(index) {
    setState(() {
      taskList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Task Deleted Successfullyy."),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                // icon: Icon(Icons.email),
                labelText: 'Eneter Task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),

            TextButton(
              onPressed: () => addTask(context),
              child: Text("Add Task"),
            ),

            SizedBox(height: 10),

            // Expanded(child: ListView(children: [...cardsList])),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color:
                        taskList[index]["isDone"]
                            ? Colors.grey
                            : const Color.fromARGB(255, 147, 193, 231),
                    child: ListTile(
                      title: Text(taskList[index]["taskname"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => updateTaskStatus(index),
                            icon: Icon(
                              taskList[index]["isDone"]
                                  ? Icons.check_box
                                  : Icons.check_box_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () => deleteTask(index),
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
