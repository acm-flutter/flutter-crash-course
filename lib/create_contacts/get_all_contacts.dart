// import 'package:flutter/material.dart';
// import 'package:test_app/create_contacts/fire_store_functions.dart';
// import 'package:test_app/create_contacts/user_model.dart';
// import 'package:test_app/create_contacts/widgets/contact_card.dart';

// class GetAllUsers extends StatelessWidget {
//   const GetAllUsers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<MyUser>>(
//       future: getAllUsers(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text('');
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Dialog(
//               child: Text(snapshot.error.toString()),
//             ),
//           );
//         } else if (snapshot.hasData) {
//           var users = snapshot.data!;
//           return Scaffold(
//             body: Container(
//               constraints: BoxConstraints(
//                 minHeight: MediaQuery.of(context).size.height,
//               ),
//               decoration: BoxDecoration(color: Colors.teal),
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(height: 10),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ListView.separated(
//                           physics: NeverScrollableScrollPhysics(),
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           itemCount: users.length,
//                           itemBuilder: (context, index) => ContactCard(
//                             contact: users[index],
//                           ),
//                           separatorBuilder: (context, index) =>
//                               const SizedBox(height: 0),
//                           shrinkWrap: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else
//           return Scaffold(
//             body: Center(
//               child: Text('No Data'),
//             ),
//           );
//       },
//     );
//   }
// }
