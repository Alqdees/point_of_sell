import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 28,
          ),
          TextField(
            name: "Item Name",
            icons: Icons.person,
          ),
          const SizedBox(
            height: 28,
          ),
          TextField(
            name: "Code Item",
            icons: Icons.barcode_reader,
          ),
          const SizedBox(
            height: 28,
          ),
          TextField(
            name: "Price Item",
            icons: Icons.price_change,
          ),
          const SizedBox(
            height: 28,
          ),
          TextField(name: "Description Item", icons: Icons.description),
          const SizedBox(
            height: 42,
          ),
          OutlinedButton(
            onPressed: () async {},
            child: const Text(
              'ADD DATA',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  TextField({
    super.key,
    this.name,
    this.icons,
  });
  String? name;
  IconData? icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        
        decoration: InputDecoration(
          labelText: name,
          prefixIcon: Icon(
            icons,
            color: Colors.blue,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurple.shade300,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
