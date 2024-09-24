import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/final_project/services/models.dart';
import 'package:test_app/final_project/shared/methods/navigation.dart';
import 'package:test_app/firestore_usage/user_model.dart';
import 'package:test_app/meals_project/meals_home_screen.dart';

class FirestoreFunctions {
  var users = FirebaseFirestore.instance.collection('users');
  var mealsColRef = FirebaseFirestore.instance.collection('meals');
  void createUser({required UserModel user}) async {
    await users
        .add(user.toMap())
        .then((value) {})
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<UserModel> getUser({required String documentId}) async {
    var ref = users.doc(documentId);
    var data = await ref.get();
    var user = UserModel().fromMap(data: data.data());
    return user;
  }

  Future<void> createNewMeal({
    required String title,
    required String img,
    required String description,
    required BuildContext context,
  }) async {
    var ref = mealsColRef.doc();
    var meal =
        Meal(title: title, description: description, uid: ref.id, img: img);
    await ref
        .set(
      meal.toMap(),
    )
        .then((value) {
      goTo(context: context, screen: MealsHomeScreen());
    });
  }

  Future<void> updateMealImage(
      {required img, required mealId, required context}) async {}

  Future<List<UserModel>> getAllUsers() async {
    var data = await users.get();
    var myData = data.docs.map((doc) => doc.data());
    var usersData = myData.map((data) => UserModel().fromMap(data: data));
    var usersList = usersData.toList();
    return usersList;
  }
}
