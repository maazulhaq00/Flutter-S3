import 'package:flutter/material.dart';
import 'package:mystore/screens/admin/product/DisplayProductsScreen.dart';

import '../screens/admin/category/CreateCategoryScreen.dart';
import '../screens/admin/product/CreateProductScreen.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Admin App'),
          ),
          ListTile(
            title: Text("Category"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateCategoryScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Create Product"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateProductScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Products List"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayProductsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
