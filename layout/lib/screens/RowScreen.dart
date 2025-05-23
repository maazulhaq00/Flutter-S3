import 'package:flutter/material.dart';

class RowScreen extends StatelessWidget {
  const RowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Screen"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Row(
        children: [
          Container(
            color: Colors.green.shade300,
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(20),
            child: Text("Text 1"),
          ),
          Container(
            color: Colors.green.shade400,
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(20),
            child: Text("Text 2"),
          ),
          Container(
            color: Colors.green.shade500,
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(20),
            child: Text("Text 3"),
          ),
        ],
      ),
    );
  }
}
