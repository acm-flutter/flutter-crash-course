import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/splash_screen.dart';
import 'package:test_app/final_project/services/auth_service.dart';
import '../shared/methods/navigation.dart';
import 'models.dart';

class FirestoreServices {
  var fireStoreRef = FirebaseFirestore.instance;
  var usersColRef = FirebaseFirestore.instance.collection('users');
  var mealsColRef = FirebaseFirestore.instance.collection('meals');
  var departmentsColRef = FirebaseFirestore.instance.collection('departments');
  var currentUser = Auth().myUser;
  void createNewUser({
    required String name,
    required String uid,
    required String phoneNumber,
    required String subject,
    required String department,
    required BuildContext context,
  }) async {
    var ref = usersColRef.doc(uid);
    var user = Student(
      name: name,
      phoneNumber: phoneNumber,
      uid: uid,
      subject: subject,
    );
    await ref.set(
      user.toMap(),
    );
  }

  Future<Student> getUserById({required String id}) async {
    var ref = usersColRef.doc(id);
    var myDoc = await ref.get();
    var theTrueData = Student().fromMap(myDoc.data());
    print(theTrueData.uid);
    // theTrueData.uid = ref.id;
    return theTrueData;
  }

  Future<List<Department>> getDepartments() async {
    var myDocs = await departmentsColRef.get();
    var groupsDocs = myDocs.docs.map((e) => e.data());
    var theTrueData = groupsDocs.map((e) => Department().fromMap(e));
    var theTrueDataList = theTrueData.toList();
    return theTrueDataList;
  }

  Future<List<Student>> getAvailableTuters({required String subject}) async {
    var ref = FirebaseFirestore.instance.collection('users');
    var myDocs = await ref.where('subject', isEqualTo: subject).get();
    var myUsersDocs = myDocs.docs.map((e) => e.data());
    var theTrueData = myUsersDocs.map((e) => Student().fromMap(e));
    var theTrueDataList = theTrueData.toList();
    return theTrueDataList;
  }

  Future<List<Meal>> getAvailableMeals() async {
    var ref = FirebaseFirestore.instance.collection('meals');
    var myDocs = await ref.get();
    var myUsersDocs = myDocs.docs.map((e) => e.data());
    var theTrueData = myUsersDocs.map((e) => Meal().fromMap(e));
    var theTrueDataList = theTrueData.toList();
    return theTrueDataList;
  }

  Future<void> updateProfilImage({required imageUrl, required context}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .update({
      'img': imageUrl,
    }).then((value) {
      goTo(context: context, screen: SplashScreen());
    });
  }

  Future<void> deleteuserDocs() async {
    await FirebaseFirestore.instance
        .collection('networks')
        .doc(currentUser!.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .delete();
  }
}

  // Future<void> updateProfilData({
  //   required String name,
  //   required context,
  //   required String phoneNumber,
  // }) async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(currentUser!.uid)
  //       .update({
  //     'name': name,
  //     'phoneNumber': phoneNumber,
  //   }).then((value) {
  //     // goTo(context: context, screen: ProfileScreen(currentUser: currentUser));
  //   });
  // }

