import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mystore/utlis/constants.dart';
import 'package:mystore/widgets/AdminDrawer.dart';

class DisplayProductsScreen extends StatefulWidget {
  const DisplayProductsScreen({super.key});

  @override
  State<DisplayProductsScreen> createState() => _DisplayProductsScreenState();
}

class _DisplayProductsScreenState extends State<DisplayProductsScreen> {
  Map<String, String> categoryMap = {};

  void fetchCategories() async {
    var catSnapshot = await db.collection('category').get();
    var catDocsList = catSnapshot.docs;
    setState(() {
      for (var catDoc in catDocsList) {
        // categoryMap.addEntries({
        //   "${catDoc.id}": "${catDoc.data()['categoryName']}",
        // });
        categoryMap[catDoc.id] = catDoc.data()["categoryName"];
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Products"))),
      drawer: AdminDrawer(),
      backgroundColor: const Color.fromARGB(255, 178, 210, 236),
      body: Container(
        padding: EdgeInsets.all(20),
        child:
            categoryMap.isEmpty
                ? Center(child: CircularProgressIndicator())
                : StreamBuilder(
                  stream: db.collection('product').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final prodDocsList = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: prodDocsList.length,
                      itemBuilder: (context, index) {
                        final prodId = prodDocsList[index].id;
                        final prodData =
                            prodDocsList[index].data() as Map<String, dynamic>;

                        var catId = prodData['productCatId'];
                        var catName = categoryMap[catId!];

                        return Card(
                          child: ListTile(
                            leading:
                                prodData['productImageUrl'] != null
                                    ? Image.network(
                                      prodData['productImageUrl'],
                                      // width: 200,
                                      // height: 300,
                                      // fit: BoxFit.cover,
                                    )
                                    : Text("No Prodt Img"),
                            title: Text(prodData['productName']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rs. ${prodData['productPrice']}"),
                                Text(catName ?? 'No Category Found'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
      ),
    );
  }
}
