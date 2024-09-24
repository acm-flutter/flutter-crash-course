import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_app/create_contacts/new_home_screen.dart';
import 'package:test_app/final_project/screens/home_screen.dart';
import 'package:test_app/final_project/screens/splash_screen.dart';
import 'package:test_app/firestore_usage/all_users_screen.dart';
import 'package:test_app/firestore_usage/firestore_new_functions.dart';
import 'package:test_app/firestore_usage/firestore_read.dart';
import 'package:test_app/firestore_usage/user_model.dart';
import 'package:test_app/meals_project/meals_home_screen.dart';
import 'package:test_app/select_lists/one_option_list.dart';
import 'screens.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(
            255,
            255,
            153,
            0,
          ),
        ),
        useMaterial3: true,
      ),
      home: ProjectHomeScreen(),
    );
  }
}
