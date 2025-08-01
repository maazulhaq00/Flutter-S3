import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mystore/screens/admin/category/CreateCategoryScreen.dart';
import 'firebase_options.dart';
import 'screens/admin/WelcomeScreen.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WelcomeScreen());
  }
}
