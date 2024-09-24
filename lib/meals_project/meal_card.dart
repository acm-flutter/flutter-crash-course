import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/single_tuter_screen.dart';
import 'package:test_app/final_project/services/models.dart';
import 'package:test_app/final_project/shared/themes/colors.dart';
import 'package:test_app/final_project/shared/themes/text.dart';
import 'package:test_app/meals_project/single_meal.dart';
import 'package:test_app/shared_methods.dart';

class MealCard extends StatelessWidget {
  MealCard({super.key, required this.meal});
  Meal meal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          goto(
            context: context,
            screen: SingleMealScreen(
              meal: meal,
            ),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: lightOrange,
              radius: 30,
              child: meal.img.isEmpty
                  ? Text(
                      meal.title[0].toUpperCase(),
                      style: h4,
                    )
                  :
                  //method check if the url is valid or not
                  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        image: NetworkImage(meal.img),
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              meal.title,
              style: title1.merge(TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
