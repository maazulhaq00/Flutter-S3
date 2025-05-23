import 'package:flutter/material.dart';
import 'package:rich_app/screens/HomeScreen.dart';
import 'package:rich_app/screens/SearchScreen.dart';

void main() {
  // runApp(
  //   MaterialApp(
  //     home: Center(
  //       child: Text("Hello World"),
  //     ),
  //   )
  // );

  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen()
    );
  }
}


