import 'package:flutter/material.dart';
import 'package:mystore/widgets/AdminDrawer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("WELCOME ADMIN"))),
      drawer: AdminDrawer(),
      backgroundColor: const Color.fromARGB(255, 178, 210, 236),
      body: Center(child: Text("Welcome to Admin Dashboard")),
    );
  }
}
