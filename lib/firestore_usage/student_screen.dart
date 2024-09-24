import 'package:flutter/material.dart';
import 'package:test_app/firestore_usage/user_model.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({super.key, required this.student});
  UserModel student;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              child: Text(student.name[0]),
              radius: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(student.name),
            SizedBox(
              height: 20,
            ),
            Text(student.phoneNumber),
          ],
        ),
      ),
    );
  }
}
