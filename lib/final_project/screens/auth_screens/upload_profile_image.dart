import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/final_project/services/storage_functions.dart';
import 'package:test_app/final_project/shared/widgets/action_button.dart';
import '../../shared/themes/colors.dart';
import '../../shared/widgets/back_button.dart';

class UploadImage extends StatelessWidget {
  UploadImage({super.key, required this.myImage});
  File myImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(),
        title: Text('Upload Profile Image'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundColor: lightOrange,
              backgroundImage: FileImage(myImage),
              radius: 100,
            ),
            SizedBox(
              height: 30,
            ),
            ActionButton(
              title: 'Upload Image',
              action: () {
                StorageServices().uploadProfileImage(
                  imageFile: myImage,
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
