import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {

  final IconData? rowIcon;
  final String rowText;


  const InfoRow({super.key, required this.rowIcon, required this.rowText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(rowIcon, color: Colors.deepPurple),
          SizedBox(width: 10),
          Text(
            rowText,
            style: TextStyle(color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
