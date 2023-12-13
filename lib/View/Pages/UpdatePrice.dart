import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/generated/l10n.dart';

import '../Colors/Colors.dart';
import '../Widget/TextField.dart';

class UpdatePrice extends StatelessWidget {
  UpdatePrice({Key? key}) : super(key: key);
  TextEditingController Sale = TextEditingController();

  TextEditingController Buy = TextEditingController();
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).update_price),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return TextFieldCustom(
                        name: S.of(context).sale_price,
                        icons: Icons.person,
                        text: Sale,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () async {
                      await controller.updateSalePrice(double.parse(Sale.text));
                      Sale.clear();
                    },
                    child: Text(
                      S.of(context).sale_price,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorUsed.appBarColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return TextFieldCustom(
                        name: S.of(context).buy_price,
                        icons: Icons.price_change,
                        text: Buy,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () async {
                      await controller.updateBuyPrice(double.parse(Buy.text));
                      Buy.clear();
                    },
                    child: Text(
                      S.of(context).buy_price,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorUsed.appBarColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
