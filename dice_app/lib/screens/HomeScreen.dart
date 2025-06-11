import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Dice Rolling App")),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(child: Image.asset("images/dice${leftDiceNumber}.png")),
            Expanded(child: Image.asset("images/dice${rightDiceNumber}.png")),
          ],
        ),
      ),
    );
  }
}
