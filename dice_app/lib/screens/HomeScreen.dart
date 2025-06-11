import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void diceButtonPressed() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; 
      rightDiceNumber =  Random().nextInt(6) + 1;
    });

    print("ldn --> $leftDiceNumber");
    print("rdn --> $rightDiceNumber");
  }

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
            Expanded(
              child: TextButton(
                onPressed: diceButtonPressed,
                child: Image.asset("images/dice${leftDiceNumber}.png"),
              ),
            ),

            Expanded(
              child: TextButton(
                onPressed: diceButtonPressed,
                child: Image.asset("images/dice${rightDiceNumber}.png"),
              ),
            ),

            // Expanded(
            //   child: TextButton(
            //     onPressed: () {
            //       print("Hello");
            //     },
            //     child: Text("Hello"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
