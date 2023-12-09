import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';

import '../../generated/l10n.dart';
import '../Pages/UpdateData.dart';
import 'AllItems.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        controller.paginationData();
        return controller.items.isEmpty
            ? const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Wait'),
                    ]),
              )
            : Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      controller: controller.controller,
                      itemCount: controller.isLaodingMore
                          ? controller.items.length + 1
                          : controller.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AllItems(
                          name: controller.items[index].name,
                          sale: controller.items[index].sale,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final width = MediaQuery.of(context).size.width;
                                return AlertDialog(
                                  title: Text(S.of(context).select),
                                  actions: [
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Get.to(
                                              UpdateData(
                                                named: controller
                                                    .items[index].name,
                                                coded: controller
                                                    .items[index].code,
                                                saled: controller
                                                    .items[index].sale,
                                                buyt:
                                                    controller.items[index].buy,
                                                quan: controller
                                                    .items[index].quantity,
                                              ),
                                            );
                                          },
                                          child: Text(
                                            S.of(context).edit,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width / 5,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            controller.deleteItem(
                                                controller.items[index].id);
                                            Get.back();
                                          },
                                          child: Text(
                                            S.of(context).delete,
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 22,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
