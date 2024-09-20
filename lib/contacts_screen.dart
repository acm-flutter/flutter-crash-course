import 'package:flutter/material.dart';
import 'package:test_app/home_screen.dart';
import 'package:test_app/shared_methods.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts Screen"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text('My Contacts Screen'),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              goto(
                context: context,
                screen: HomeScreen(),
              );
            },
            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
