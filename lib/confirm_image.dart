import 'dart:io';
import 'package:flutter/material.dart';

class ConfirmTheImage extends StatelessWidget {
  ConfirmTheImage({super.key, required this.imageFile});
  File imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CircleAvatar(
            radius: 200,
            backgroundImage: FileImage(imageFile),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: () {
              print('Confirm Image');
            },
            label: Text(
              'Confirm Image',
            ),
            icon: Icon(
              Icons.image,
            ),
          ),
        ],
      ),
    );
  }
}
