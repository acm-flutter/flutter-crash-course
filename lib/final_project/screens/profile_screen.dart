import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/final_project/services/services.dart';
import '../../home_screen.dart';
import '../services/auth_service.dart';
import '../shared/methods/check_network_image_validation.dart';
import '../shared/methods/navigation.dart';
import '../shared/themes/colors.dart';
import '../shared/themes/text.dart';
import '../shared/widgets/action_button.dart';
import '../shared/widgets/back_button.dart';
import '../shared/widgets/loader.dart';
import 'auth_screens/login_screen.dart';
import 'auth_screens/upload_profile_image.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, required this.currentUser});
  User? currentUser;
  @override
  Widget build(BuildContext context) {
    return currentUser == null
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  goTo(context: context, screen: HomeScreen());
                },
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: orange,
                ),
              ),
            ),
            body: Center(
              child: ActionButton(
                  title: 'You have to login first',
                  action: () {
                    goTo(context: context, screen: LoginScreen());
                  }),
            ),
          )
        : FutureBuilder(
            future: FirestoreServices().getUserById(id: currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoaderScreen();
              } else if (snapshot.hasError) {
                return Scaffold(
                  body: Column(
                    children: [
                      Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: h2Bold,
                        ),
                      ),
                      ActionButton(
                        title: 'sign out',
                        action: () {
                          Auth().userLogout(context: context);
                        },
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasData) {
                Student profileOwner;
                profileOwner = snapshot.data!;
                return SafeArea(
                  bottom: true,
                  left: true,
                  top: true,
                  right: true,
                  maintainBottomViewPadding: true,
                  minimum: EdgeInsets.zero,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text(
                        profileOwner.name,
                      ),
                      leading: MyBackButton(),
                      // actions: [
                      //   IconButton(
                      //     onPressed: () {
                      //       Auth().userLogout(context: context);
                      //     },
                      //     icon: Icon(
                      //       Icons.logout,
                      //       size: 30,
                      //       color: orange,
                      //     ),
                      //   ),
                      // ],
                    ),
                    body: Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(children: [
                            //profileOwner image
                            Container(
                              height: 200,
                              width: 200,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: lightOrange,
                                    radius: 100,
                                    child: profileOwner.img.isEmpty
                                        ? Text(
                                            profileOwner.name[0].toUpperCase(),
                                            style: h1Bold,
                                          )
                                        : FutureBuilder(
                                            future: isValidNetowrkImage(
                                                url: profileOwner.img),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Loader();
                                              } else if (snapshot.hasError ||
                                                  snapshot.data == false) {
                                                return Text(
                                                  profileOwner.name[0]
                                                      .toUpperCase(),
                                                  style: h4,
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        profileOwner.img),
                                                    fit: BoxFit.cover,
                                                    height: 200,
                                                    width: 200,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 12,
                                        bottom: 12,
                                      ),
                                      child: FloatingActionButton.small(
                                        backgroundColor: mediumDarkRed,
                                        child: Icon(
                                          Icons.edit,
                                          color: white,
                                        ),
                                        onPressed: () async {
                                          File imageFile;
                                          var imagePicker = ImagePicker();
                                          var pickedImage =
                                              await imagePicker.pickImage(
                                            source: ImageSource.gallery,
                                          );
                                          if (pickedImage == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'No Image was selected',
                                                ),
                                                duration: Duration(
                                                  seconds: 2,
                                                ),
                                                backgroundColor: grey,
                                              ),
                                            );
                                          } else {
                                            imageFile = File(pickedImage.path);
                                            goTo(
                                              context: context,
                                              screen: UploadImage(
                                                myImage: imageFile,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //profileOwner name
                            Text(
                              profileOwner.name,
                              style: h5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // ActionButton(
                            //   title: 'Delete profile',
                            //   titleStyle: title2.merge(TextStyle(color: white)),
                            //   action: () {
                            //     AwesomeDialog(
                            //       titleTextStyle:
                            //           h4Bold.merge(TextStyle(color: black)),
                            //       customHeader: Icon(
                            //         Icons.warning,
                            //         color: lightRed,
                            //         size: 60,
                            //       ),
                            //       btnOkColor: Colors.red,
                            //       btnCancelColor: Color(0xFF00CA71),
                            //       context: context,
                            //       dialogType: DialogType.warning,
                            //       animType: AnimType.rightSlide,
                            //       title: 'Delete Profile',
                            //       desc:
                            //           'Are you sure that you awnt to delete your profile ?',
                            //       btnCancelOnPress: () {},
                            //       btnOkOnPress: () async {
                            //         //method that deletes the user's profile
                            //         await Auth().deleteUser(
                            //           context: context,
                            //         );
                            //       },
                            //     ).show();
                            //   },
                            //   buttonColor: lightRed,
                            // ),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  profileOwner.phoneNumber,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 125, 125, 125)),
                                ),
                                Icon(
                                  Icons.phone,
                                  color: Color.fromARGB(255, 125, 125, 125),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Bio'),
                            SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'No Profile was found',
                      style: h2Bold,
                    ),
                  ),
                );
              }
            },
          );
  }
}
