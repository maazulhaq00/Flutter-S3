import 'package:flutter/material.dart';
import 'package:todo_app/screens/TodoScreen.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  void login(BuildContext context) {
    if (emailController.text == "" || passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("email / password required"),
          backgroundColor: Colors.red,
        ),
      );
    } else if (emailController.text == "maaz@gmail.com" &&
        passwordController.text == "maaz123") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Success."),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TodoScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Incorrect email / password."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User Login"),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                // icon: Icon(Icons.email),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                // icon: Icon(Icons.lock_open),
                labelText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextButton(onPressed: () => login(context), child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
