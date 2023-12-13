import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/Account%20Orders.dart';
import 'package:point_of_sell/View/Pages/Add_Item.dart';
import 'package:point_of_sell/View/Pages/UpdateData.dart';
import 'package:point_of_sell/View/Pages/UpdatePrice.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import 'package:point_of_sell/generated/l10n.dart';

import '../Widget/CardView.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final ch = Get.lazyPut(() => HomeController(), fenix: true);
  HomeController c = Get.find();

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    c.paginationData();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 65.0,
        backgroundColor: ColorUsed.appBarColor,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: GetBuilder<HomeController>(
          builder: (controller) {
            return controller.title;
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              c.changeWidget();
            },
            icon: GetBuilder<HomeController>(
              builder: (controller) => controller.actionsicon,
            ),
          ),
        ],
      ), // _appBar(context, scaffoldKey, controller),
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
            SizedBox(
              width: 5,
              height: 1,
              child: Container(color: ColorUsed.appBarColor),
            ),
            ListTile(
              title: Text(S.of(context).update_price),
              onTap: () {
                Get.to(UpdatePrice());
              },
            ),
             SizedBox(
              width: 5,
              height: 1,
              child: Container(color: ColorUsed.appBarColor),
            ),
            ListTile(
              title: Text(S.of(context).account_orders),
              onTap: () {
                Get.to(const AccountOrders());
              },
            ),
          ],
        ),
      ),
      body: CardView(),
    );
  }

  PreferredSize _appBar(
      BuildContext ctx, GlobalKey<ScaffoldState> key, HomeController c) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        // margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(ctx, c),
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
                  ),
                  IconButton(
                      onPressed: () {
                        c.changeWidget();
                      },
                      icon: c.actionsicon),
                  Center(
                    child: c.title,
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

Widget _topBar(BuildContext context, HomeController home) {
  return Expanded(
    flex: 1,
    child: home.title,
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
