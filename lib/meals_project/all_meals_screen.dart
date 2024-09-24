import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/widgets/tuter_card.dart';
import 'package:test_app/final_project/services/firestore_services.dart';
import 'package:test_app/final_project/shared/widgets/loader.dart';
import 'package:test_app/firestore_usage/firestore_functions.dart';
import 'package:test_app/meals_project/meal_card.dart';

class AllMealsScreen extends StatelessWidget {
  AllMealsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meals'),
      ),
      body: FutureBuilder(
        future: FirestoreServices().getAvailableMeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('There is an error'),
            );
          } else if (snapshot.hasData) {
            var meals = snapshot.data;
            if (meals!.isEmpty) {
              return Center(
                child: Text('There are no Meals'),
              );
            } else {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return MealCard(
                    meal: meals[index],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  height: 2,
                  color: Colors.grey,
                ),
                itemCount: meals.length,
              );
            }
          } else {
            return Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
