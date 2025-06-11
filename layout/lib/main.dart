import 'package:flutter/material.dart';
import 'package:layout/screens/AlignmentScreen.dart';
import 'package:layout/screens/HomeScreen.dart';
import 'package:layout/screens/RainbowScreen.dart';
import 'package:layout/screens/RowScreen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RainbowScreen(),
    );
  }
}