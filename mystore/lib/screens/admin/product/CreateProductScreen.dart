import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mystore/screens/admin/category/EditCategoryScreen.dart';
import 'package:mystore/widgets/AdminDrawer.dart';
import 'package:mystore/utlis/constants.dart';

// var db = FirebaseFirestore.instance;

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final catNameController = TextEditingController();

  void addProduct() async {
    // try {
    //   await db.collection("category").add({
    //     "categoryName": catNameController.text,
    //   });

    //   catNameController.clear();

    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text("Category Added Successfully"),
    //       backgroundColor: Colors.green,
    //     ),
    //   );
    // } catch (err) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("Error Occureed"), backgroundColor: Colors.red),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Create Product"))),
      drawer: AdminDrawer(),
      backgroundColor: const Color.fromARGB(255, 178, 210, 236),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: catNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: addProduct, child: Text("Add")),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
