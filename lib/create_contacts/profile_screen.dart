// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:test_app/create_contacts/user_model.dart';

// import '../screens.dart';

// class ProfileScreen extends StatelessWidget {
//   ProfileScreen({super.key, required this.user});
//   MyUser user;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       bottom: true,
//       left: true,
//       top: true,
//       right: true,
//       maintainBottomViewPadding: true,
//       minimum: EdgeInsets.zero,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             user.name,
//           ),
//         ),
//         body: Container(
//           width: double.infinity,
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Column(
//                 children: [
//                   //user image
//                   Container(
//                     height: 200,
//                     width: 200,
//                     child: Stack(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.orange,
//                           radius: 100,
//                           child: user.img.isEmpty
//                               ? Text(
//                                   user.name[0].toUpperCase(),
//                                   style: TextStyle(fontSize: 30),
//                                 )
//                               : ClipRRect(
//                                   borderRadius: BorderRadius.circular(100),
//                                   child: Image(
//                                     image: NetworkImage(user.img),
//                                     fit: BoxFit.cover,
//                                     height: 200,
//                                     width: 200,
//                                   ),
//                                 ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30,)
//                   ,Text(data)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
