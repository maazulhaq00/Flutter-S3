import 'package:flutter/material.dart';

class AlignmentScreen extends StatelessWidget {
  const AlignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alignment Screen"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.deepPurple.shade200,
            child: Text("Container 1"),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.deepOrange.shade200,
            child: Text("Container 2"),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.lightGreen.shade200,
            child: Text("Container 3"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
          )
        ],
      ),
    );
  }
}