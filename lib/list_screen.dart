import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});
  List<String> names = [
    'Ahmed',
    'Mahmoud',
    'Omar',
    'Saeed',
    'Asem',
    'Belal',
    'Ahmed',
    'Mahmoud',
    'Omar',
    'Saeed',
    'Asem',
    'Belal',
    'Ahmed',
    'Mahmoud',
    'Omar',
    'Saeed',
    'Asem',
    'Belal',
    'Ahmed',
    'Mahmoud',
    'Omar',
    'Saeed',
    'Asem',
    'Belal',
    'Ahmed',
    'Mahmoud',
    'Omar',
    'Saeed',
    'Asem',
    'Belal',
    'Ahmed',
    'Mahmoud',
    'Omar',
    'Saeed',
    'Asem',
    'Belal',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              names[index],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemCount: names.length,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
