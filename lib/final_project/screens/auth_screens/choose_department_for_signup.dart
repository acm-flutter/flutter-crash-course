import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/auth_screens/choose_subject_for_signup.dart';
import 'package:test_app/final_project/services/firestore_services.dart';
import 'package:test_app/final_project/services/models.dart';
import 'package:test_app/final_project/shared/widgets/loader.dart';
import 'package:test_app/screens.dart';

class ChooseDepartmentForSignUp extends StatelessWidget {
  const ChooseDepartmentForSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreServices().getDepartments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoaderScreen();
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Something Went Wrong'),
            ),
          );
        } else if (snapshot.hasData) {
          List<Department> departments = snapshot.data!.toList();
          print(departments);
          return Scaffold(
            appBar: AppBar(),
            body: ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(departments[index].name),
                  onTap: () {
                    goto(
                        context: context,
                        screen: ChooseSubjectScreenForSignUp(
                          department: departments[index],
                        ));
                  },
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemCount: departments.length,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Something Went Wrong'),
            ),
          );
        }
      },
    );
  }
}
