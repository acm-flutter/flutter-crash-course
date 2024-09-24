import 'package:flutter/material.dart';
import 'package:test_app/firestore_usage/student_screen.dart';
import 'package:test_app/firestore_usage/user_model.dart';

import '../../screens.dart';

class StudentCard extends StatelessWidget {
  StudentCard({
    super.key,
    required this.user,
  });

  UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goto(
          context: context,
          screen: StudentScreen(
            student: user,
          ),
        );
      },
      child: Container(
        // color: Colors. ,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Text(
                user.name[0],
              ),
              backgroundColor: Colors.blue,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(user.name),
                SizedBox(
                  height: 5,
                ),
                Text(user.phoneNumber),
              ],
            )
          ],
        ),
      ),
    );
  }
}
