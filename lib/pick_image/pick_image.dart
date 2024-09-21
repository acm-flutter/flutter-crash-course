// import 'dart:io';
// import '../screens.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:test_app/pick_image/confirm_profile_image.dart';

// File? imageFile;

// class PickImage extends StatelessWidget {
//   const PickImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           children: [
//             imageFile != null
//                 ? CircleAvatar(
//                     backgroundColor: Colors.orange,
//                     backgroundImage: FileImage(imageFile!),
//                     radius: 100,
//                   )
//                 : SizedBox(),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton.icon(
//               label: Text('Pick Image'),
//               icon: Icon(Icons.image),
//               onPressed: () async {
//                 var imagePicker = ImagePicker();
//                 var pickedImage = await imagePicker.pickImage(
//                   source: ImageSource.gallery,
//                 );
//                 if (pickedImage == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                         'No Image was selected',
//                       ),
//                       duration: Duration(
//                         seconds: 2,
//                       ),
//                       backgroundColor: Colors.grey,
//                     ),
//                   );
//                 } else {
//                   imageFile = File(pickedImage.path);
//                   goto(
//                     context: context,
//                     screen: ConfirmImage(
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
