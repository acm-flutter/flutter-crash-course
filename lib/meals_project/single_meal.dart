import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_app/final_project/services/auth_service.dart';
import 'package:test_app/final_project/services/models.dart';
import 'package:test_app/final_project/shared/themes/colors.dart';
import 'package:test_app/final_project/shared/themes/text.dart';
import 'package:test_app/final_project/shared/widgets/loader.dart';

class SingleMealScreen extends StatelessWidget {
  SingleMealScreen({super.key, required this.meal});
  Meal meal;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            meal.title,
          ),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //meal image
                  Image(
                    image: NetworkImage(meal.img),
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //meal name
                  Text(
                    meal.title,
                    style: h5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    meal.description,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 125, 125, 125)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
