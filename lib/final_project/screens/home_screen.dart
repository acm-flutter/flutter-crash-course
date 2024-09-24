import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/auth_screens/choose_department_for_signup.dart';
import 'package:test_app/final_project/screens/choose_department.dart';
import 'package:test_app/final_project/shared/methods/navigation.dart';
import 'package:test_app/shared_methods.dart';

class ProjectHomeScreen extends StatelessWidget {
  const ProjectHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print("Getting tuters");
                goto(context: context, screen: ChooseDepartment());
              },
              child: Text("Get a tuter"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                goTo(context: context, screen: ChooseDepartmentForSignUp());
              },
              child: Text("Become a tuter"),
            ),
          ],
        ),
      ),
    );
  }
}
