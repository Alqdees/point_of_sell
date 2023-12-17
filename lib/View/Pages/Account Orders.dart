import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Model/Models/Items.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/generated/l10n.dart';
import 'package:searchfield/searchfield.dart';

import '../../Model/Models/DataBaseApp/DataBaseSqflite.dart';

class AccountOrders extends StatelessWidget {
  AccountOrders({Key? key}) : super(key: key);
  TextEditingController? text = TextEditingController();
  HomeController controller = Get.find();

  Items? it = Items(
    name: 'name',
    code: 'code',
    sale: 'sale',
    buy: 'buy',
    quantity: 'quantity',
    id: 'id',
  );

  @override
  Widget build(BuildContext context) {
    controller.getDataFromAccount();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).account_orders,
        ),
        backgroundColor: ColorUsed.appBarColor,
        leading: IconButton(
          onPressed: () {
            Get.back();

            controller.onDelete();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return SearchField(
                    onSearchTextChanged: (p0) {
                      controller.searchInData(p0.toString());
                      controller.update();
                      return controller.search
                          .map((e) => SearchFieldListItem(
                                e.name,
                                item: Items,
                                child: Text(e.name),
                              ))
                          .toList();
                    },
                    suggestions: controller.search
                        .map(
                          (e) => SearchFieldListItem(
                            e.name + e.sale,
                            item: Items,
                            child: GestureDetector(
                              onTap: () {
                                print('eeee   __ ${e.name}');
                              },
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        e.name,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.sale,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    controller: text,
                    searchInputDecoration: InputDecoration(
                      labelText: S.of(context).itemName,
                      prefixIcon: Icon(
                        Icons.category,
                        color: ColorUsed.appBarColor,
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorUsed.appBarColor,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: ColorUsed.appBarColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView.builder(
                itemCount: controller.accounts.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(controller.accounts[i].sale),
                    leading: Text(controller.accounts[i].name),
                  );
                }),
          ),
          const Expanded(
            flex: 1,
            child: Text(
              'Result',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
