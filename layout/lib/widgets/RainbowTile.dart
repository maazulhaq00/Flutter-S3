import 'package:flutter/material.dart';

class RainbowTile extends StatelessWidget {
  
  final Color color;
  final String text;
  
  const RainbowTile({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 7,
      child: Center(child: Text(this.text)),
    );
  }
}
