import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/Model/Models/Items.dart';
import 'package:point_of_sell/generated/l10n.dart';

class HomeController extends GetxController {
  List<Items> items = [];
  List<Items> copy = [];
  bool isLaodingMore = false;
  ScrollController controller = ScrollController();
  int skip = 0;
  int limit = 20;
  late DataBaseSqflite dataBaseSqflite;
  HomeController() {
    dataBaseSqflite = DataBaseSqflite();
  }
  Future<void> addItems(Map<String, dynamic> data) async {
    await dataBaseSqflite.insert(data);
    items.clear();
    paginationData();
    update();
  }

  void paginationData() async {
    // items are list All data
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
    var dataList = await dataBaseSqflite.getAllUser(skip, limit);
    var item = dataList
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

  Future<void> deleteItem(String id) async {
    items.clear();
    await dataBaseSqflite.delete(id);
    paginationData();
    update();
  }

  Future<void> updateData(
    Map<String, dynamic> data,
    String id,
  ) async {
    items.clear();
    await dataBaseSqflite.updateItem(data, id);
    paginationData();
    update();
  }

  Future<void> updateSalePrice(double v) async {
    items.clear();
    await dataBaseSqflite.updateCostCol(v);
    paginationData();
    update();
  }

  Future<void> updateBuyPrice(double v) async {
    items.clear();
    await dataBaseSqflite.updateBuyCol(v);
    paginationData();
    update();
  }

//  Future<void> changeWidget() async {
//     if (actionsicon.icon == Icons.search) {
//       copys = todoItem;

//       actionsicon = const Icon(Icons.close);
//       title = TextField(
//         controller: text,
//         keyboardType: TextInputType.text,
//         style: TextStyle(
//             fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
//         textAlign: TextAlign.start,
//         autofocus: true,
//         onChanged: (value) {
//           searchInData(value);
//         },
//       );
//     } else {
//       todoItem = copys;
//       copys = [];
//       search = [];
//       text.text = '';
//       actionsicon = const Icon(Icons.search);
//       title = Text(S().mainScreen);
//     }
//     notifyListeners();
//   }

  Widget title = const Text('Any');
  Icon actionsicon = const Icon(
    Icons.search,
    color: Colors.white,
  );
  final TextEditingController text = TextEditingController();
  Future<void> changeWidget() async {
    if (actionsicon.icon == Icons.search) {
      copy = items;
      actionsicon = const Icon(Icons.close, color: Colors.white);

      title = TextFormField(
        controller: text,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: S().search,
          focusedBorder: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.start,
        autofocus: true,
        onChanged: (value) {
          searchInData(value);
        },
      );
      update();
    } else {
      items = copy;
      copy = [];
      actionsicon = const Icon(
        Icons.search,
        color: Colors.white,
      );
      title = const Text('Any');
      update();
      paginationData();
    }
    // update();
  }

  Future<void> searchInData(String v) async {
    List<Map<String, dynamic>>? data =
        await dataBaseSqflite.searchInDatabase(v);
    List<Items> newResult = data
        .map(
          (item) => Items(
            name: item[DataBaseSqflite.name],
            code: item[DataBaseSqflite.codeItem],
            sale: item[DataBaseSqflite.sale],
            buy: item[DataBaseSqflite.buy],
            quantity: item[DataBaseSqflite.quantity],
            id: item[DataBaseSqflite.id].toString(),
          ),
        )
        .toList();
    items.clear();
    items = newResult;
    update();
  }

  Future<void> insertInAccount(Map<String, dynamic> data) async {
    await dataBaseSqflite.insertInAccount(data);
    update();
  }

  List<Items> accounts = [];
  Future<void> getDataFromAccount() async {
    // DataBaseHelper _baseHelper = DataBaseHelper();
    var dataList = await dataBaseSqflite.getAllDataFromAccount(skip, limit);
    var item = dataList
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

    accounts.addAll(item);
    update();
  }

  List<Items> search = [];
  void accountOrder(
    String v,
  ) async {
    search.clear();
    List<Map<String, dynamic>>? getData = await dataBaseSqflite.accountOrder(v);

    search = getData
        .map((item) => Items(
              name: item[DataBaseSqflite.name],
              code: item[DataBaseSqflite.codeItem],
              sale: item[DataBaseSqflite.sale],
              buy: item[DataBaseSqflite.buy],
              quantity: item[DataBaseSqflite.quantity],
              id: item[DataBaseSqflite.id].toString(),
            ))
        .toList();
  }

  void newFunction() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () {
        items = copy;
        copy = [];
        update();
      },
    );
  }
}
