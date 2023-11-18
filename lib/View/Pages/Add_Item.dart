import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  "Name",
                ),
              ),
              initialValue: "",
            ),
          ]),
        ),
      ),
    );
  }
}
