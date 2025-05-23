import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App"), backgroundColor: Colors.lightBlue,),
      body: Container(
        margin: EdgeInsets.all(20),        
        // margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        // padding: EdgeInsets.only(top: 40, left: 40),
        width: 300,
        height: 300,
        color: Colors.lime.shade400,
        child: Text("Hello World")
        ),
    );
  }
}