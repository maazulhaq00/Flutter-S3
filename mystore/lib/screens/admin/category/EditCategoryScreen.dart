import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mystore/utlis/constants.dart';

// var db = FirebaseFirestore.instance;

class EditCategoryScreen extends StatefulWidget {
  final Map<String, dynamic> category;
  final String docId;

  const EditCategoryScreen({
    super.key,
    required this.category,
    required this.docId,
  });

  @override
  State<EditCategoryScreen> createState() =>
      _EditCategoryScreenState(category: this.category, docId: this.docId);
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final catNameController = TextEditingController();

  final Map<String, dynamic> category;
  final String docId;

  _EditCategoryScreenState({required this.category, required this.docId}) {
    catNameController.text = category["categoryName"];
  }

  void updateCategory() async {
    try {
      await db.collection("category").doc(docId).update({
        "categoryName": catNameController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Category Updated Successfully"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error Occureed"), backgroundColor: Colors.red),
      );
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Edit Category"))),
      backgroundColor: const Color.fromARGB(255, 178, 210, 236),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: catNameController,
              decoration: InputDecoration(
                labelText: 'Category Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: updateCategory, child: Text("Update")),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
