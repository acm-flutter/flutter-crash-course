import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/auth_screens/signup_screen.dart';
import 'package:test_app/final_project/screens/tuters_screen.dart';
import 'package:test_app/final_project/services/models.dart';
import 'package:test_app/final_project/shared/themes/text.dart';

import '../../../shared_methods.dart';

class ChooseSubjectScreen extends StatelessWidget {
  ChooseSubjectScreen({super.key, required this.department});
  Department department;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Subject"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.grey,
            title: Text(
              department.subjects[index],
              style: h5,
            ),
            onTap: () {
              goto(
                  context: context,
                  screen: TutersScreen(
                    subject: department.subjects[index],
                  ));
            },
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemCount: department.subjects.length,
      ),
    );
  }
}
