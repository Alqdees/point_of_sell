import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context, scaffoldKey),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 18, 8, 46),
              ),
              child: Text(
                S.of(context).SaleofPoint,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title:  Text(S.of(context).add),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => const Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text('1'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('2'),
                ],
              ),
            ),
          ],
        ),
      ),
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
  return const BoxDecoration(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
    gradient: LinearGradient(
      colors: [Color.fromARGB(255, 18, 8, 46), Color.fromARGB(255, 18, 8, 46)],
      // begin: Alignment.topCenter,
      // end: Alignment.bottomCenter,
    ),
  );
}

Widget _topBar(BuildContext context) {
  return const Row(
    children: [
      // Image.asset(
      //   'assets/logo.png',
      //   scale: 50,
      // ),
      Expanded(
        child: Text(
          'Point Of Sale',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      // const CircleAvatar(
      //   radius: 15,
      //   backgroundImage: AssetImage('assets/profile.jpeg'),
      // )
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
        style: const TextStyle(fontSize: 40),
      ),
    ],
  );
}
