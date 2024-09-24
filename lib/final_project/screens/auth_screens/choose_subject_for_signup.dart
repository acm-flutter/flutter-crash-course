import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/auth_screens/signup_screen.dart';
import 'package:test_app/final_project/services/models.dart';

import '../../../shared_methods.dart';

class ChooseSubjectScreenForSignUp extends StatelessWidget {
  ChooseSubjectScreenForSignUp({super.key, required this.department});
  Department department;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(department.subjects[index]),
            onTap: () {
              goto(
                context: context,
                screen: SignUpScreen(
                  department: department.name,
                  subject: department.subjects[index],
                ),
              );
            },
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemCount: department.subjects.length,
      ),
    );
    ;
  }
}
