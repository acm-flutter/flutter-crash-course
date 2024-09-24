import 'package:flutter/material.dart';

class CheckableItemList extends StatefulWidget {
  @override
  _CheckableItemListState createState() => _CheckableItemListState();
}

class _CheckableItemListState extends State<CheckableItemList> {
  // List of items and their selected state
  List<Map<String, dynamic>> items = [
    {"name": "Item 1", "isChecked": false},
    {"name": "Item 2", "isChecked": false},
    {"name": "Item 3", "isChecked": false},
    {"name": "Item 4", "isChecked": false},
  ];

// Function to get all selected items
  List<String> getSelectedItems() {
    return items
        .where((item) => item['isChecked'] == true) // Filter checked items
        .map((item) => item['name'] as String) // Cast the name to String
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkable Items List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(items[index]['name']),
                  value: items[index]['isChecked'],
                  onChanged: (value) {
                    setState(() {
                      items[index]['isChecked'] = value!;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: getSelectedItems().isEmpty
                  ? null // Disable button if no items are selected
                  : () {
                      List<String> selectedItems = getSelectedItems();
                      if (selectedItems.isNotEmpty) {
                        // Do something with the selected items
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Selected Items"),
                              content: Text(selectedItems.join(", ")),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}
