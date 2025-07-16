import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mystore/screens/admin/category/EditCategoryScreen.dart';
import 'package:mystore/widgets/AdminDrawer.dart';
import 'package:mystore/utlis/constants.dart';

import 'package:http/http.dart' as http;

// var db = FirebaseFirestore.instance;

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final prodNameController = TextEditingController();
  final prodPriceController = TextEditingController();

  List<DropdownMenuItem> categoryDdList = [];

  String selectedCategoryId = "";

  XFile? _image;
  final picker = ImagePicker();

  void fetchCategory() async {
    var catSnapsot = await db.collection('category').get();
    var catDocsList = catSnapsot.docs;

    for (int i = 0; i < catDocsList.length; i++) {
      // var catData = catDocsList[i].data();
      categoryDdList.add(
        DropdownMenuItem(
          value: catDocsList[i].id,
          child: Text(catDocsList[i].data()["categoryName"]),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchCategory();
  }

  void selectCategoryDbChange(value) {
    selectedCategoryId = value;
  }

  void pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  // 1. Create a function to upload image cloudinary & return url
  Future<String?> uploadImageToCloudinary(XFile image) async {
    const cloudName = "djk3nb4nk";
    const uploadPreset = "mystore";
    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
    );
    final imgBytes = await image.readAsBytes();

    // 2. create & send request
    final request =
        http.MultipartRequest("POST", url)
          ..fields['upload_preset'] = uploadPreset
          ..files.add(
            http.MultipartFile.fromBytes(
              'file',
              imgBytes,
              filename: image.name,
            ),
          );

    final response = await request.send();

    // 3. Read / Handle response & return url
    if (response.statusCode == 200) {
      final resStr = await response.stream.bytesToString();
      final jsonData = json.decode(resStr);

      return jsonData['secure_url'];
    } else {
      return null;
    }
  }

  void addProduct() async {
    if (prodNameController.text != "" &&
        prodPriceController.text != "" &&
        selectedCategoryId != "" &&
        _image != null) {
      // 4. call function created in 1
      final imageUrl = await uploadImageToCloudinary(_image!);

      // 5. save image url in firebase db
      if (imageUrl != null) {
        try {
          await db.collection("product").add({
            "productName": prodNameController.text,
            "productPrice": prodPriceController.text,
            "productCatId": selectedCategoryId,
            "productImageUrl": imageUrl,
          });

          prodNameController.clear();
          prodPriceController.clear();
          setState(() {
            _image = null;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Product Added Successfully"),
              backgroundColor: Colors.green,
            ),
          );
        } catch (err) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error Occureed"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Image Failed to upload"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fill Required Fields"),
          backgroundColor: Colors.red,
        ),
      );
    }
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
            // PROD NAME INPUT
            TextField(
              controller: prodNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),

            // PROD PRICE INPUT
            TextField(
              controller: prodPriceController,
              decoration: InputDecoration(
                labelText: 'Product Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),

            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Product Category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: categoryDdList,
              onChanged: selectCategoryDbChange,
            ),

            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child:
                  _image != null
                      ? Image.network(_image!.path, width: 200)
                      : Text("No Image Selected"),
            ),

            SizedBox(height: 10),
            ElevatedButton(onPressed: pickImage, child: Text("Upload Image")),

            SizedBox(height: 10),
            ElevatedButton(onPressed: addProduct, child: Text("Add")),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
