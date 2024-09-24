import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/firestore_usage/firestore_functions.dart';
import 'package:test_app/firestore_usage/firestore_read.dart';
import 'package:test_app/firestore_usage/user_model.dart';

class AddUser extends StatelessWidget {
  UserModel user;

  AddUser({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                FirestoreFunctions().createUser(
                  user: user,
                );
              },
              child: Text(
                "Add User",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GetUserName("GQjIMZv0tPHgiPJKsjG4"),
          ],
        ),
      ),
    );
  }
}
