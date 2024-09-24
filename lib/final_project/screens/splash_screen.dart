import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/home_screen.dart';
import 'package:test_app/final_project/screens/tuter_home_screen.dart';
import 'package:test_app/final_project/services/auth_service.dart';
import 'package:test_app/final_project/shared/methods/navigation.dart';
import 'package:test_app/final_project/shared/themes/text.dart';
import 'package:test_app/firestore_usage/user_model.dart';

import '../../screens.dart';
import '../services/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(Duration(seconds: 3), () async {
      if (Auth().myUser == null) {
        goToWithoutBackButton(context: context, screen: ProjectHomeScreen());
      } else {
        goToWithoutBackButton(context: context, screen: TuterHomeScreen());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'My Tuter',
          style: h1Bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
