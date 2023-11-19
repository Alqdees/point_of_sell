import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';

import '../Widget/TextField.dart';

class AddItem extends StatelessWidget {
  AddItem({Key? key}) : super(key: key);
  DataBaseSqflite? data;

  @override
  Widget build(BuildContext context) {
    data = DataBaseSqflite();
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
          ),
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: "Code Item",
            icons: Icons.barcode_reader,
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
await              data!.insert(DataBaseSqflite.TableName, {
                "Name": "ahemd",
                "Code": "123",
                "Price": "123",
                "Description": "ahemd444"
              });
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
