import 'package:flutter/material.dart';
import 'package:test_app/meals_project/add_meal_screen.dart';
import 'package:test_app/meals_project/all_meals_screen.dart';

import '../final_project/shared/methods/navigation.dart';
import '../shared_methods.dart';

class MealsHomeScreen extends StatelessWidget {
  const MealsHomeScreen({super.key});

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
                goto(context: context, screen: AddMealScreen());
              },
              child: Text("Add new meal"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                goTo(context: context, screen: AllMealsScreen());
              },
              child: Text("Show All Meals"),
            ),
          ],
        ),
      ),
    );
  }
}
