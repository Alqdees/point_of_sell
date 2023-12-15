import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/generated/l10n.dart';

import '../Widget/TextField.dart';

class AccountOrders extends StatelessWidget {
  AccountOrders({Key? key}) : super(key: key);
  TextEditingController? text = TextEditingController();
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).account_orders,
        ),
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
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              controller: text,
              onChanged: (v) {
                controller.searchInData(v);
              },
              decoration: InputDecoration(
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
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, i) {
                  return const ListTile(
                    leading: Text('Ahmed'),
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
