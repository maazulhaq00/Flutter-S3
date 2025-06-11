import 'package:busniesscard_app/wigets/InfoRow.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  final TextStyle mystyle1 = TextStyle(
    fontFamily: "Pacifico",
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  
  final TextStyle mystyle2 = TextStyle(
    fontFamily: 'SourceCodePro',
    color: Colors.white,
    fontSize: 20,
    letterSpacing: 2,
    fontWeight: FontWeight.bold,
  );

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Container(
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
              radius: 50,
            ),
            SizedBox(height: 10),
            Text("Muhammad Umair", style: mystyle1),
            Text("Game Developer", style: mystyle2),

            SizedBox(height: 70),

            InfoRow(rowIcon: Icons.phone, rowText: "+92 312 1234567"),
            InfoRow(rowIcon: Icons.email, rowText: "mumair@example.com"),
            InfoRow(
              rowIcon: Icons.home,
              rowText: "House ABC, Street 123, NN, Karachi",
            ),
          ],
        ),
      ),
    );
  }
}
