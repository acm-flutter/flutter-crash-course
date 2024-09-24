// import 'package:flutter/material.dart';
// import 'package:test_app/create_contacts/add_new_user.dart';
// import 'package:test_app/create_contacts/get_all_contacts.dart';
// import 'package:test_app/create_contacts/profile_screen.dart';
// import '../screens.dart';

// class NewHomeScreen extends StatelessWidget {
//   NewHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text('My new app'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStateProperty.all(Colors.blue),
//                   ),
//                   onPressed: () {
//                     goto(context: context, screen: AddNewUser());
//                   },
//                   child: Text(
//                     'Create new user',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStateProperty.all(Colors.blue),
//                   ),
//                   onPressed: () {
//                     goto(context: context, screen: GetAllUsers());
//                   },
//                   child: Text(
//                     'Get all users',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStateProperty.all(Colors.blue),
//                   ),
//                   onPressed: () {
//                     // goto(context: context, screen: ProfileScreen());
//                   },
//                   child: Text(
//                     'my profile',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
