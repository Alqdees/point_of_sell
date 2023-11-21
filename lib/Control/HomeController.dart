import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/Model/Models/Items.dart';

class HomeController extends GetxController {
  List<Items> items = [];

  bool isLaodingMore = false;
  ScrollController controller = ScrollController();
  int skip = 0;
  int limit = 20;
  late DataBaseSqflite dataBaseSqflite;
  HomeController() {
    dataBaseSqflite = DataBaseSqflite();
  }

  Future<void> paginationData() async {
    if (items.isEmpty) {
      getPData();
    }
    controller.addListener(
      () async {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          isLaodingMore = true;
          getPData();
          skip = skip + limit;
          isLaodingMore = false;
        }
      },
    );
  }

  Future<void> getPData() async {
    // DataBaseHelper _baseHelper = DataBaseHelper();
    var dataList =
        await dataBaseSqflite.getAllUser(skip.toString(), limit.toString());
    var item = dataList!
        .map((i) => Items(
              name: i![DataBaseSqflite.name].toString(),
              code: i[DataBaseSqflite.codeItem].toString(),
              sale: i[DataBaseSqflite.sale].toString(),
              buy: i[DataBaseSqflite.buy].toString(),
              quantity: i[DataBaseSqflite.quantity].toString(),
              id: i[DataBaseSqflite.id].toString(),
            ))
        .toList();
    // log('${item.length} ____');

    items.addAll(item);
    update();
  }
  
  
}
