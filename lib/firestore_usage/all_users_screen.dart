import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/firestore_usage/firestore_functions.dart';
import 'package:test_app/firestore_usage/student_screen.dart';
import 'package:test_app/firestore_usage/user_model.dart';
import 'package:test_app/firestore_usage/widgets/student_card.dart';
import 'package:test_app/shared_methods.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: FirestoreFunctions().getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('there is an error => ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            var users = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: StudentCard(user: users[index]),
              ),
              itemCount: users!.length,
            );
          } else {
            return Center(
              child: Text('Somthing went wrong'),
            );
          }
        },
      ),
    );
  }
}
