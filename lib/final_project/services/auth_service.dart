import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/final_project/screens/home_screen.dart';
import 'package:test_app/final_project/services/firestore_services.dart';
import 'package:test_app/final_project/services/storage_functions.dart';
import 'package:test_app/home_screen.dart';
import '../shared/methods/navigation.dart';
import '../shared/themes/colors.dart';
import '../shared/themes/text.dart';

class Auth {
  User? myUser = FirebaseAuth.instance.currentUser;

  void createUserByEmail({
    required String email,
    required String password,
    required BuildContext context,
    required String name,
    required String phoneNumber,
    required String subject,
    required String department,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        FirestoreServices().createNewUser(
          name: name,
          phoneNumber: phoneNumber,
          uid: value.user!.uid,
          department: department,
          subject: subject,
          context: context,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'User Added Successfully',
              style: title1,
            ),
            backgroundColor: lightRed,
            showCloseIcon: true,
            duration: Duration(seconds: 2),
            closeIconColor: white,
            behavior: SnackBarBehavior.floating,
          ),
        );
        await Future.delayed(Duration(seconds: 2));
        goToWithoutBackButton(
          context: context,
          screen: ProjectHomeScreen(),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AwesomeDialog(
          context: context,
          title: 'passowrd error',
          dialogType: DialogType.error,
          desc: 'The password provided is too weak.',
          descTextStyle: h5.merge(
            TextStyle(
              color: black,
            ),
          ),
        ).show();
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(
          context: context,
          title: 'email error',
          dialogType: DialogType.error,
          desc: 'The account already exists for that email.',
          descTextStyle: h5.merge(
            TextStyle(
              color: black,
            ),
          ),
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          title: 'error',
          dialogType: DialogType.error,
          desc: e.toString(),
          descTextStyle: h5.merge(
            TextStyle(
              color: black,
            ),
          ),
        ).show();
      }
    } catch (e) {
      AwesomeDialog(
        context: context,
        title: 'error',
        dialogType: DialogType.error,
        desc: e.toString(),
        descTextStyle: h5.merge(
          TextStyle(
            color: black,
          ),
        ),
      ).show();
    }
  }

  void userLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        goTo(context: context, screen: ProjectHomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AwesomeDialog(
          context: context,
          title: 'email error',
          dialogType: DialogType.error,
          desc: 'No user found for that email.',
          descTextStyle: h5.merge(
            TextStyle(
              color: black,
            ),
          ),
        ).show();
      } else if (e.code == 'wrong-password') {
        AwesomeDialog(
          context: context,
          title: 'password error',
          dialogType: DialogType.error,
          desc: 'Wrong password provided for that user.',
          descTextStyle: h5.merge(
            TextStyle(
              color: black,
            ),
          ),
        ).show();
      }
    }
  }

  Future<void> deleteUserAcount(
      {required String uid, required context}) async {}

  void userLogout({required context}) async {
    await FirebaseAuth.instance.signOut();
    goTo(
      context: context,
      screen: ProjectHomeScreen(),
    );
  }

  Future<void> deleteUser({required context}) async {
    await FirestoreServices().deleteuserDocs();
    await StorageServices().deleteUserStorage();
    await myUser?.delete();
    goTo(
      context: context,
      screen: ProjectHomeScreen(),
    );
  }
}
