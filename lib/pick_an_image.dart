import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/confirm_image.dart';
import 'package:test_app/screens.dart';

class PickAnImage extends StatelessWidget {
  const PickAnImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var imagePicker = ImagePicker();
            var imagePicked = await imagePicker.pickImage(
              source: ImageSource.gallery,
            );
            if (imagePicked == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'No Image Was Selected',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              var imageFile = File(imagePicked.path);
              goto(
                context: context,
                screen: ConfirmTheImage(
                  imageFile: imageFile,
                ),
              );
            }
          },
          child: Text(
            'Pick an image',
          ),
        ),
      ),
    );
  }
}
