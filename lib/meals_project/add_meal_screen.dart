import 'package:flutter/material.dart';
import 'package:test_app/shared_methods.dart';

class AddMealScreen extends StatelessWidget {
  AddMealScreen({super.key});
  TextEditingController mealTitle = TextEditingController();
  TextEditingController mealDiscription = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: mealTitle,
                onFieldSubmitted: (value) {
                  // print(value.toString());
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field can't be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // goto(
                  //   context: context,
                  //   screen: ContactsScreen(
                  //     name: name.text,
                  //   ),
                  // );
                }
              },
              child: Text(
                "Pass Data",
              ),
            ),
          ],
        ),
      ),
    );
  }
}