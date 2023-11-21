import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/generated/l10n.dart';

import '../Widget/TextField.dart';

class AddItem extends StatefulWidget {
  AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  DataBaseSqflite? data;

  TextEditingController name = TextEditingController();

  TextEditingController code = TextEditingController();

  TextEditingController sale = TextEditingController();

  TextEditingController buy = TextEditingController();

  TextEditingController quantity = TextEditingController();

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
            name: S.of(context).itemName,
            icons: Icons.person,
            text: name,
          ),
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: S.of(context).code,
            icons: Icons.barcode_reader,
            text: code,
          ),
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: S.of(context).sale,
            icons: Icons.price_change,
            text: sale,
          ),
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: S.of(context).buy,
            icons: Icons.description,
            text: buy,
          ),
          const SizedBox(
            height: 28,
          ),
          TextFieldCustom(
            name: S.of(context).quantity,
            icons: Icons.description,
            text: quantity,
          ),
          const SizedBox(
            height: 42,
          ),
          OutlinedButton(
            onPressed: () async {
              int result = await data!.insert(
                DataBaseSqflite.TableName,
                {
                  DataBaseSqflite.name: name.text,
                  DataBaseSqflite.codeItem: code.text,
                  DataBaseSqflite.sale: sale.text,
                  DataBaseSqflite.buy: buy.text,
                  DataBaseSqflite.quantity: quantity.text
                },
              );
              if (result > 0) {
               
                name.clear();
                code.clear();
                sale.clear();
                buy.clear();
                quantity.clear();
                setState(() {
                  
                });
              } else {
                print("____-Field");
              }
            },
            child: Text(
              S.of(context).add,
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
