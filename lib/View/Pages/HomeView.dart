import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.black12,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.teal,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: const Text('Add'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                  )
                ],
              ),
            ),
          ),
          const Expanded(
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
    );
  }
}
