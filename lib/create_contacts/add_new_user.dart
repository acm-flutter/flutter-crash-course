// import 'package:flutter/material.dart';
// import 'package:test_app/contacts_screen.dart';
// import 'package:test_app/create_contacts/fire_store_functions.dart';
// import 'package:test_app/home_screen.dart';
// import 'package:test_app/shared_methods.dart';

// class AddNewUser extends StatelessWidget {
//   AddNewUser({super.key});
//   TextEditingController name = TextEditingController();
//   TextEditingController phoneNumber = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('Collect User Data'),
//       ),
//       body: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: TextFormField(
//                 controller: name,
//                 onFieldSubmitted: (value) {
//                   // print(value.toString());
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Field can't be empty";
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                       width: 2,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       color: Colors.orange,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: TextFormField(
//                 controller: phoneNumber,
//                 onFieldSubmitted: (value) {
//                   // print(value.toString());
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Field can't be empty";
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                       width: 2,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       color: Colors.orange,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   createNewUser(
//                     name: name.text,
//                     phoneNumber: phoneNumber.text,
//                     context: context,
//                   );
//                 }
//               },
//               child: Text(
//                 "Pass Data",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
