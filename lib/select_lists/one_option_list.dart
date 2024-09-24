import 'package:flutter/material.dart';

class NewSingleChoiceScreen extends StatefulWidget {
  const NewSingleChoiceScreen({super.key});

  @override
  State<NewSingleChoiceScreen> createState() => _NewSingleChoiceScreenState();
}

class _NewSingleChoiceScreenState extends State<NewSingleChoiceScreen> {
  List<String> names = [
    'Ahmed',
    'Mohamed',
    'Aly',
    'Samy',
  ];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Choice List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return RadioListTile<String>(
                  title: Text(names[index]),
                  value: names[index],
                  groupValue: selectedItem,
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                );
              },
              itemCount: names.length,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedItem == null
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Selected Item'),
                          content: Text(selectedItem!),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Exit',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
              child: Text(
                'Confirm my choice',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
