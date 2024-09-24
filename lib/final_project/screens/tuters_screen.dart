import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/widgets/tuter_card.dart';
import 'package:test_app/final_project/services/firestore_services.dart';
import 'package:test_app/final_project/shared/widgets/loader.dart';
import 'package:test_app/firestore_usage/firestore_functions.dart';

class TutersScreen extends StatelessWidget {
  TutersScreen({super.key, required this.subject});
  String subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tuters'),
      ),
      body: FutureBuilder(
        future: FirestoreServices().getAvailableTuters(subject: subject),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('There is an error'),
            );
          } else if (snapshot.hasData) {
            var tuters = snapshot.data;
            if (tuters!.isEmpty) {
              return Center(
                child: Text('There are no tuters for this subject'),
              );
            } else {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return TuterCard(
                    student: tuters[index],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  height: 2,
                  color: Colors.grey,
                ),
                itemCount: tuters.length,
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
