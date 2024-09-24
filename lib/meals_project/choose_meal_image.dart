import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_app/final_project/services/storage_functions.dart';
import '../screens.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? imageFile;

class ChooseMealImageScreen extends StatefulWidget {
  ChooseMealImageScreen(
      {super.key, required this.description, required this.title});
  String title;
  String description;
  @override
  State<ChooseMealImageScreen> createState() => _ChooseMealImageScreenState();
}

class _ChooseMealImageScreenState extends State<ChooseMealImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            imageFile != null
                ? CircleAvatar(
                    backgroundColor: Colors.orange,
                    backgroundImage: FileImage(imageFile!),
                    radius: 100,
                  )
                : SizedBox(),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                label: imageFile == null
                    ? Text('Pick Image')
                    : Text('Confirm image'),
                icon: Icon(Icons.image),
                onPressed: imageFile == null
                    ? () async {
                        var imagePicker = ImagePicker();
                        var pickedImage = await imagePicker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (pickedImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'No Image was selected',
                              ),
                              duration: Duration(
                                seconds: 2,
                              ),
                              backgroundColor: Colors.grey,
                            ),
                          );
                        } else {
                          setState(() {
                            imageFile = File(pickedImage.path);
                          });
                        }
                      }
                    : () {
                        StorageServices().uploadMealImage(
                          mealDescription: widget.description,
                          mealTitle: widget.title,
                          imageFile: imageFile!,
                          context: context,
                        );
                      }),
          ],
        ),
      ),
    );
  }
}
