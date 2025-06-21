import 'package:flutter/material.dart';
import 'package:navigation/screens/HomeScreen.dart';
import 'package:navigation/screens/NavigationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: NavigationScreen()
      );
  }
}
