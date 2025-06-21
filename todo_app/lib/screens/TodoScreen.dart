import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final taskController = TextEditingController();

  List<Map<String, dynamic>> taskList = [];

  List<Widget> cardsList = [];

  void addTask(BuildContext context) {
    setState(() {
      taskList.add({"taskname": taskController.text, "isDone": false});
      cardsList.add(Card(child: ListTile(title: Text(taskController.text))));
    });

    taskController.text = "";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Task Added."), backgroundColor: Colors.green),
    );

    print(taskList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
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

            ...cardsList,
          ],
        ),
      ),
    );
    ;
  }
}
