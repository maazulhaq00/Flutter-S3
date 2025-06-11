import 'package:flutter/material.dart';
import 'package:layout/widgets/RainbowTile.dart';

class RainbowScreen extends StatelessWidget {
  const RainbowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RainbowTile(color: Colors.purple.shade200, text: "V"),
          RainbowTile(color: Colors.indigo.shade200, text: "I"),
          RainbowTile(color: Colors.blue.shade200, text: "B"),
          RainbowTile(color: Colors.green.shade200, text: "G"),
          RainbowTile(color: Colors.yellow.shade200, text: "Y"),
          RainbowTile(color: Colors.orange, text: "O"),
          RainbowTile(color: Colors.red, text: "R"),
        ],
      ),
    );
  }
}
