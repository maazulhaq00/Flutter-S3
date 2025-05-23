import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          title: Center(
            child: Text("Rich App", style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: Colors.black,
        ),
        // body: Center(child: Text("Hello World", style: TextStyle(color: Colors.brown),)),
        body: Center(
          child: Image(
            image: AssetImage(
              "images/diamonds.webp",
            ),
          ),
        ),
      );
  }
}