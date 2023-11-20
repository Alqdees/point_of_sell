import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';

import '../Widget/TextField.dart';

class AddItem extends StatelessWidget {
  AddItem({Key? key}) : super(key: key);
  DataBaseSqflite? data;
  TextEditingController? name;
  TextEditingController code = TextEditingController();
  TextEditingController sale = TextEditingController();
  TextEditingController buy = TextEditingController();
  TextEditingController quantity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    data = DataBaseSqflite();
    name = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
        backgroundColor: ColorUsed.appBarColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: "Item Name",
            icons: Icons.person,
            text: name,
          ),
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: "Code Item",
            icons: Icons.barcode_reader,
            text: code,
          ),
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: "Price Item",
            icons: Icons.price_change,
          ),
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: "Description Item",
            icons: Icons.description,
          ),
          const SizedBox(
            height: 42,
          ),
          OutlinedButton(
            onPressed: () async {
              
              
            },
            child: Text(
              'ADD DATA',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorUsed.appBarColor,
                fontSize: 14,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
