import 'package:flutter/material.dart';
import 'package:test_app/create_contacts/profile_screen.dart';
import 'package:test_app/final_project/screens/choose_department.dart';
import 'package:test_app/final_project/screens/profile_screen.dart';
import 'package:test_app/final_project/services/auth_service.dart';

import '../../shared_methods.dart';

class TuterHomeScreen extends StatelessWidget {
  const TuterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                goto(
                  context: context,
                  screen: ProfileScreen(
                    currentUser: Auth().myUser,
                  ),
                );
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              print("Getting tuters");
              goto(context: context, screen: ChooseDepartment());
            },
            child: Text("Get a tuter"),
          ),
        ),
      ),
    );
  }
}
