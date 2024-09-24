import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_app/final_project/screens/auth_screens/login_screen.dart';
import 'package:test_app/final_project/services/auth_service.dart';
import 'package:test_app/final_project/shared/themes/text.dart';
import 'package:test_app/final_project/shared/widgets/action_button.dart';

import '../../shared/themes/colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key, required this.department, required this.subject});
  String department;
  String subject;

  var name = TextEditingController();
  var phoneNumber = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  bool isHidden = true;
  var formKey = GlobalKey<FormState>();
  var phoneNumberdNode = FocusNode();
  var emailNode = FocusNode();
  var passwordNode = FocusNode();
  var confirmPasswordNode = FocusNode();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'SignUp',
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //name text field
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(phoneNumberdNode);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name can't be empty";
                        }
                        return null;
                      },
                      controller: name,
                      keyboardType: TextInputType.name,
                      cursorColor: black,
                      style: title1.merge(TextStyle(color: black)),
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: grey,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: lightRed,
                            width: 2,
                          ),
                        ),
                        label: Text(
                          'enter a valid name',
                          style: title1
                              .merge(TextStyle(color: black))
                              .merge(TextStyle(color: grey)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //phoneNumber text field
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(emailNode);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "phone number can't be empty";
                        }
                        return null;
                      },
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      cursorColor: black,
                      style: title1.merge(TextStyle(color: black)),
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: grey,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: lightRed,
                            width: 2,
                          ),
                        ),
                        label: Text(
                          'enter a valid phone number',
                          style: title1
                              .merge(TextStyle(color: black))
                              .merge(TextStyle(color: grey)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //email text field
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passwordNode);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email can't be empty";
                        }
                        return null;
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: black,
                      style: title1.merge(TextStyle(color: black)),
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: grey,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: lightRed,
                            width: 2,
                          ),
                        ),
                        label: Text(
                          'enter a valid email',
                          style: title1
                              .merge(TextStyle(color: black))
                              .merge(TextStyle(color: grey)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //password text field
                    StatefulBuilder(
                      builder: (context, setState) => TextFormField(
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(confirmPasswordNode);
                        },
                        focusNode: passwordNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password can't be empty";
                          }
                          return null;
                        },
                        controller: password,
                        obscureText: isHidden,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: black,
                        style: title1.merge(TextStyle(color: black)),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: isHidden == true
                                ? Icon(Icons.lock, color: grey)
                                : Icon(Icons.lock_open, color: lightRed),
                            onPressed: () {
                              isHidden = !isHidden;
                              setState(() {});
                            },
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: grey,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: lightRed,
                              width: 2,
                            ),
                          ),
                          label: Text(
                            'enter a password',
                            style: title1
                                .merge(TextStyle(color: black))
                                .merge(TextStyle(color: grey)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: grey,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //confirm password text field
                    StatefulBuilder(
                      builder: (context, setState) => TextFormField(
                        focusNode: confirmPasswordNode,
                        validator: (value) {
                          if (password.text.isEmpty) {
                            return "Password can't be empty";
                          }
                          if (value != password.text)
                            return "passwords doesn't match";
                          return null;
                        },
                        controller: confirmPassword,
                        obscureText: isHidden,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: black,
                        style: title1.merge(TextStyle(color: black)),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: isHidden == true
                                ? Icon(Icons.lock, color: grey)
                                : Icon(Icons.lock_open, color: lightRed),
                            onPressed: () {
                              isHidden = !isHidden;
                              setState(() {});
                            },
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: grey,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: lightRed,
                              width: 2,
                            ),
                          ),
                          label: Text(
                            'confirm password',
                            style: title1
                                .merge(TextStyle(color: black))
                                .merge(TextStyle(color: grey)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: grey,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ActionButton(
                      title: 'SignUp',
                      buttonWidth: double.infinity,
                      buttonheight: 60,
                      titleStyle: h5Bold,
                      action: () async {
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).requestFocus(
                            FocusNode(),
                          );
                          Auth().createUserByEmail(
                            email: email.text,
                            password: password.text,
                            name: name.text,
                            phoneNumber: phoneNumber.text,
                            context: context,
                            department: department,
                            subject: subject,
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Or',
                      style: h4Bold.merge(
                        TextStyle(color: grey),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Already have an account',
                          style: title2.merge(
                            TextStyle(color: grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
