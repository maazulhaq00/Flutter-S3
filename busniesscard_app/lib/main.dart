import 'package:busniesscard_app/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BusinessCardApp());
}


class BusinessCardApp extends StatelessWidget {
  const BusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}