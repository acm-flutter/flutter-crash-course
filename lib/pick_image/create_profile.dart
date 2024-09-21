// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class CreateProfileScrean extends StatelessWidget {
//   var phoneNumberNode = FocusNode();
//   var name = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   var phoneNumberController = TextEditingController();
//   CreateProfileScrean({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) => GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(
//             FocusNode(),
//           );
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'Create User',
//               style: TextStyle(),
//             ),
//           ),
//           body: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     //User name text field
//                     TextFormField(
//                       onFieldSubmitted: (value) {
//                         FocusScope.of(context).requestFocus(phoneNumberNode);
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "name can't be empty";
//                         }
//                         return null;
//                       },
//                       controller: name,
//                       keyboardType: TextInputType.name,
//                       cursorColor: Colors.white,
//                       style: TextStyle(),
//                       decoration: InputDecoration(
//                         focusedErrorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 2,
//                           ),
//                         ),
//                         errorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide(
//                             color: Colors.red,
//                             width: 2,
//                           ),
//                         ),
//                         label: Text(
//                           'enter a valid name',
//                           style:
//                               TextStyle().merge(TextStyle(color: Colors.grey)),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 2,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 2,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     //password text field
//                     TextFormField(
//                       focusNode: phoneNumberNode,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "phone number can't be empty";
//                         }
//                         return null;
//                       },
//                       controller: phoneNumberController,
//                       keyboardType: TextInputType.visiblePassword,
//                       cursorColor: Colors.white,
//                       style: TextStyle(),
//                       decoration: InputDecoration(
//                         focusedErrorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 2,
//                           ),
//                         ),
//                         errorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide(
//                             color: Colors.red,
//                             width: 2,
//                           ),
//                         ),
//                         label: Text(
//                           'enter a phone number',
//                           style:
//                               TextStyle().merge(TextStyle(color: Colors.grey)),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 2,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                             width: 2,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     ElevatedButton(
//                       child: Text('Create User'),
//                       onPressed: () async {
//                         if (formKey.currentState!.validate()) {
//                           FocusScope.of(context).requestFocus(
//                             FocusNode(),
//                           );
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
// }
