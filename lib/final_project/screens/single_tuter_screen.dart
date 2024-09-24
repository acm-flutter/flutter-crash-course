import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_app/final_project/services/auth_service.dart';
import 'package:test_app/final_project/services/models.dart';
import 'package:test_app/final_project/shared/widgets/loader.dart';

import '../shared/methods/check_network_image_validation.dart';
import '../shared/themes/colors.dart';
import '../shared/themes/text.dart';

class SingleTuterScreen extends StatelessWidget {
  SingleTuterScreen({super.key, required this.student});
  Student student;
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
            student.name,
          ),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  //student image
                  Container(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundColor: lightOrange,
                      radius: 100,
                      child: student.img.isEmpty
                          ? Text(
                              student.name[0].toUpperCase(),
                              style: h1Bold,
                            )
                          : FutureBuilder(
                              future: isValidNetowrkImage(url: student.img),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Loader();
                                } else if (snapshot.hasError ||
                                    snapshot.data == false) {
                                  return Text(
                                    student.name[0].toUpperCase(),
                                    style: h4,
                                  );
                                } else {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                      image: NetworkImage(student.img),
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: 200,
                                    ),
                                  );
                                }
                              },
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //student name
                  Text(
                    student.name,
                    style: h5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 125, 125, 125),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        student.phoneNumber,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 125, 125, 125)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Try implementing a method that will launch whatsapp conversation between the user and the tuter
        // remember you have the tuter's phone number which will help you
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.phone),
        ),
      ),
    );
  }
}
