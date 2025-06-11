import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index = 0;


  void changeNoun(){
    setState(() {
      index = Random().nextInt(nouns.length);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nouns[index]),
            SizedBox(height: 40,),
            TextButton(onPressed: changeNoun, 
            child: Text("Generate Random Noun"))
          ],
        ),
      ),
    );
  }
}