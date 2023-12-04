import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/Add_Item.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import 'package:point_of_sell/generated/l10n.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  late DataBaseSqflite dataB;
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    dataB = DataBaseSqflite();

    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context, scaffoldKey),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorUsed.appBarColor,
              ),
              child: Text(
                S.of(context).SaleofPoint,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(S.of(context).add),
              onTap: () {
                Get.to(AddItem());
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
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
                                    final width =
                                        MediaQuery.of(context).size.width;
                                    return AlertDialog(
                                      title: Text(S.of(context).select),
                                      actions: [
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                S.of(context).edit,
                                                style: const TextStyle(
                                                  color: Colors.black,
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
          }),
    );
  }

  PreferredSize _appBar(BuildContext ctx, GlobalKey<ScaffoldState> key) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        // margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(ctx),
              const SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      key.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    borderRadius: const BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
    gradient: LinearGradient(
      colors: [
        ColorUsed.appBarColor,
        const Color.fromARGB(255, 18, 8, 46),
      ],
      // begin: Alignment.topCenter,
      // end: Alignment.bottomCenter,
    ),
  );
}

Widget _topBar(BuildContext context) {
  return const Row(
    children: [
      Expanded(
        child: Text(
          'Point Of Sale',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}

Widget _searchBox() {
  return SizedBox(
    height: 35,
    child: TextFormField(
      textAlign: TextAlign.start,
      // controller: _searchText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: InkWell(
          child: const Icon(Icons.close),
          onTap: () {},
        ),
        hintText: 'Search...',
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
  );
}

Widget _tabBar() {
  return TabBar(
    labelPadding: const EdgeInsets.all(0),
    labelColor: Colors.black,
    indicatorColor: Colors.black,
    unselectedLabelColor: Colors.teal.shade800,
    tabs: const [
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.home),
        text: 'Home',
      ),
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.group),
        text: 'Group',
      ),
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.notifications),
        text: 'Notifications',
      ),
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.menu),
        text: 'Menu',
      ),
    ],
  );
}

Widget _tabBarViewItem(IconData icon, String name) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: 100,
      ),
      Text(
        name,
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    ],
  );
}
