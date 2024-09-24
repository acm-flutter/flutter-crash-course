import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app/firestore_usage/firestore_functions.dart';
import 'package:test_app/firestore_usage/user_model.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: FirestoreFunctions().getUser(documentId: documentId),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong ${snapshot.error}");
        }
        if (snapshot.hasData) {
          var user = snapshot.data;
          return Text("Data from firebase: ${user!.name} ${user.phoneNumber}");
        }
        return Text("loading");
      },
    );
  }
}
