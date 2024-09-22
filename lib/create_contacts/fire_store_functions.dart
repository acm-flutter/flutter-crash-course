import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:test_app/create_contacts/user_model.dart';
import 'package:test_app/create_contacts/widgets/new_home_screen.dart';
import 'package:test_app/screens.dart';

createNewUser(
    {required String name,
    required String phoneNumber,
    required BuildContext context}) async {
  var ref = FirebaseFirestore.instance.collection('users').doc();
  var user = MyUser(
    name: name,
    phoneNumber: phoneNumber,
  );
  await ref
      .set(
    user.toMap(),
  )
      .then((value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'User added Successfully',
        ),
      ),
    );
    goto(context: context, screen: NewHomeScreen());
  });
}

Future<MyUser> getUserById({required String id}) async {
  var ref = FirebaseFirestore.instance.collection('users').doc(id);
  var myDoc = await ref.get();
  var theTrueData = MyUser().fromMap(myDoc.data());
  print(theTrueData.uid);
  theTrueData.uid = ref.id;
  return theTrueData;
}

Future<List<MyUser>> getAllUsers() async {
  var ref = FirebaseFirestore.instance.collection('users');
  var myDocs = await ref.get();
  var categoryDocs = myDocs.docs.map((e) => e.data());
  var theTrueData = categoryDocs.map((e) {
    return MyUser().fromMap(e);
  });
  var theTrueDataList = theTrueData.toList();
  return theTrueDataList;
}

Future<void> uploadProfileImage({
  required File imageFile,
  required String uid,
  required context,
}) async {
  var ref = FirebaseStorage.instance.ref();
  var imageRef = ref.child('users/$uid');
  var uploadedImage = await imageRef.putFile(imageFile);
  var imageUrl = await uploadedImage.ref.getDownloadURL();
  updateProfilImage(imageUrl: imageUrl, context: context, uid: uid);
}

Future<void> updateProfilImage(
    {required imageUrl, required context, required String uid}) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).update({
    'img': imageUrl,
  }).then((value) {});
}
