import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var db = FirebaseFirestore.instance;

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final catNameController = TextEditingController();

  void addCategory() async {
    try {
      await db.collection("category").add({
        "categoryName": catNameController.text,
      });

      catNameController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Category Added Successfully"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error Occureed"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Create Category"))),
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
            ElevatedButton(onPressed: addCategory, child: Text("Add")),
            SizedBox(height: 10),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection("category").snapshots(),
                builder: (context, snapsot) {
                  if (snapsot.hasError) {
                    return Center(child: Text("Error: ${snapsot.error}"));
                  }

                  if (snapsot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final categoryDocsList = snapsot.data!.docs;

                  return ListView.builder(
                    itemCount: categoryDocsList.length,
                    itemBuilder: (context, index) {
                      var categoryMap =
                          categoryDocsList[index].data()
                              as Map<String, dynamic>;

                      return Card(
                        child: ListTile(
                          title: Text(
                            categoryMap["categoryName"] ?? "No Cat Name",
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
