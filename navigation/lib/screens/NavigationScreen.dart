import 'package:flutter/material.dart';
import 'package:navigation/screens/HomeScreen.dart';
import 'package:navigation/screens/SearchScreen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dashboard")),
        actions: [
          IconButton(onPressed: (){
            
          }, icon: Icon(Icons.power_settings_new))
        ],
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          TextButton(
            onPressed:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
                },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: EdgeInsets.all(20),
              color: const Color.fromARGB(255, 189, 209, 219),
              child: Center(child: Text("Home")),
            ),
          ),
          TextButton(
            onPressed:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  ),
                },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: EdgeInsets.all(20),
              color: const Color.fromARGB(255, 189, 209, 219),
              child: Center(child: Text("Search")),
            ),
          ),
        ],
      ),
    );
  }
}
