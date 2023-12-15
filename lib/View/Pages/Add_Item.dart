import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/generated/l10n.dart';

import '../Widget/TextField.dart';

class AddItem extends StatelessWidget {
  DataBaseSqflite? data;

  TextEditingController name = TextEditingController();

  TextEditingController code = TextEditingController();

  TextEditingController sale = TextEditingController();

  TextEditingController buy = TextEditingController();

  TextEditingController quantity = TextEditingController();
  TextEditingController date = TextEditingController();

  AddItem({super.key});
  @override
  Widget build(BuildContext context) {
    data = DataBaseSqflite();
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Item'),
            backgroundColor: ColorUsed.appBarColor,
            leading: IconButton(
              onPressed: () {
                controller.update();
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: S.of(context).itemName,
                  icons: Icons.shape_line,
                  text: name,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: S.of(context).code,
                  icons: Icons.barcode_reader,
                  text: code,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: S.of(context).sale,
                  icons: Icons.price_change,
                  text: sale,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: S.of(context).buy,
                  icons: Icons.description,
                  text: buy,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: S.of(context).quantity,
                  icons: Icons.description,
                  text: quantity,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: S.of(context).date,
                  icons: Icons.date_range,
                  text: date,
                ),
                const SizedBox(
                  height: 18,
                ),
                OutlinedButton(
                  onPressed: () async {
                    controller.addItems(
                      {
                        DataBaseSqflite.name: name.text,
                        DataBaseSqflite.codeItem: code.text,
                        DataBaseSqflite.sale: sale.text,
                        DataBaseSqflite.buy: buy.text,
                        DataBaseSqflite.quantity: quantity.text,
                        DataBaseSqflite.date: date.text
                      },
                    );
                    name.clear();
                    code.clear();
                    sale.clear();
                    buy.clear();

                    quantity.clear();
                    date.clear();
                    controller.update();
                  },
                  child: Text(
                    S.of(context).add,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUsed.appBarColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
