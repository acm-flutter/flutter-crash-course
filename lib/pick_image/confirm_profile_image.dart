// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:test_app/pick_image/pick_image.dart';
// import 'package:test_app/screens.dart';

// class ConfirmImage extends StatelessWidget {
//   ConfirmImage({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//         title: Text('Upload Profile Image'),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             CircleAvatar(
//               backgroundColor: Colors.orange,
//               backgroundImage: FileImage(imageFile!),
//               radius: 100,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//               child: Text('Confirm Image'),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       "Image Confirmed",
//                     ),
//                   ),
//                 );
//                 goto(
//                   context: context,
//                   screen: PickImage(),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
