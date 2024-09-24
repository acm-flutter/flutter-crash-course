import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/final_project/screens/auth_screens/choose_department_for_signup.dart';
import 'package:test_app/final_project/shared/methods/navigation.dart';
import '../../services/auth_service.dart';
import '../../shared/themes/colors.dart';
import '../../shared/themes/text.dart';
import '../../shared/widgets/action_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var email = TextEditingController();

  bool isHidden = true;

  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var passwordNode = FocusNode();

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
              'Login',
              style: h5Bold,
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
                      cursorColor: white,
                      style: title1,
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
                          style: title1.merge(TextStyle(color: grey)),
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
                            color: white,
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
                        cursorColor: white,
                        style: title1,
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
                            style: title1.merge(TextStyle(color: grey)),
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
                              color: white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // email and password login
                    ActionButton(
                        title: 'Login',
                        buttonWidth: double.infinity,
                        buttonheight: 60,
                        titleStyle: h5Bold,
                        action: () async {
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).requestFocus(
                              FocusNode(),
                            );
                            Auth().userLogin(
                              email: email.text,
                              password: password.text,
                              context: context,
                            );
                          }
                        }),

                    SizedBox(
                      height: 50,
                    ),
                    // google login

                    SizedBox(
                      height: 20,
                    ),
                    ActionButton(
                        title: 'Login with Facebook',
                        buttonWidth: double.infinity,
                        buttonheight: 60,
                        titleStyle: h5Bold,
                        action: () {}),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          goTo(
                            context: context,
                            screen: ChooseDepartmentForSignUp(),
                          );
                        },
                        child: Text(
                          'Don’t have an account',
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
