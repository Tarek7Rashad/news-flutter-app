import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/Widgets/customButtonWidget.dart';
import 'package:news_app/Widgets/customTextFormField.dart';
import 'package:news_app/shared/components/constant.dart';
import 'package:news_app/shared/components/snackBar.dart';
import 'package:news_app/shared/cubit/login_signup_cubit_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool obscureTextPassword = true;
bool obscureTextCofirmPassword = true;

bool loading = false;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      progressIndicator: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kgreyColor,
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: kblueGreyColor,
            strokeWidth: 4,
          ),
        ),
      ),
      inAsyncCall: loading,
      child: BlocProvider(
        create: (context) => LoginSignupCubitCubit(),
        child: BlocConsumer<LoginSignupCubitCubit, LoginSignupCubitState>(
          listener: (context, state) {
            Navigator.pop(context);
          },
          builder: (context, state) {
            var cubit = LoginSignupCubitCubit.get(context);
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                body: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    autovalidateMode: registerAutovalidateMode,
                    key: formRegisterKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .7,
                        color: kgreyColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      fontSize: 32,
                                      color: kblackColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              CustomTextFormFieldWidget(
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "username is requird";
                                  } else {
                                    // log(value);
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  // cubit.userNaem = value;
                                },
                                hintText: "User Name",
                                labelText: "User Name",
                                controller: registerFirstNameEditingController,
                              ),
                              SizedBox(
                                height: height * .002,
                              ),
                              CustomTextFormFieldWidget(
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "email is a required field";
                                  } else if (!RegExp(
                                          r'^[\w-]+(\.[\w-]+)*@gmail\.com$')
                                      .hasMatch(value)) {
                                    return "enter a valid email address";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  cubit.registerEmail = value;
                                },
                                hintText: "Email",
                                labelText: "Email",
                                controller: registerEmailEditingController,
                              ),
                              SizedBox(
                                height: height * .002,
                              ),
                              CustomTextFormFieldWidget(
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "password is required";
                                  } else if (value.length <= 6) {
                                    return "Password is too weak";
                                  } else if (!RegExp(
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[@-_\$ /]).*$')
                                      .hasMatch(value)) {
                                    return "should be uppercase & lowercase letter,number,character (@-_\$ /)";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  cubit.registerPassword = value;
                                },
                                obscureText: obscureTextPassword,
                                suffix: IconButton(
                                    onPressed: () {
                                      if (obscureTextPassword &&
                                          registerPasswordEditingController
                                              .text.isNotEmpty) {
                                        obscureTextPassword = false;
                                        setState(() {});
                                      } else {
                                        obscureTextPassword = true;
                                        setState(() {});
                                      }
                                    },
                                    icon: const Icon(Icons.remove_red_eye)),
                                hintText: "Password",
                                labelText: "Password",
                                controller: registerPasswordEditingController,
                              ),
                              SizedBox(
                                height: height * .002,
                              ),
                              CustomTextFormFieldWidget(
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return " this is required field ";
                                  } else if (value.isNotEmpty &&
                                      registerConfirmPasswordEditingController
                                              .text !=
                                          registerPasswordEditingController
                                              .text) {
                                    return "password dosen't match ";
                                  } else {
                                    log(value.toString());
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  cubit.registerConfirmPassword = value;
                                },
                                obscureText: obscureTextCofirmPassword,
                                suffix: IconButton(
                                    onPressed: () {
                                      if (obscureTextCofirmPassword &&
                                          registerConfirmPasswordEditingController
                                              .text.isNotEmpty) {
                                        obscureTextCofirmPassword = false;
                                        setState(() {});
                                      } else {
                                        obscureTextCofirmPassword = true;
                                        setState(() {});
                                      }
                                    },
                                    icon: const Icon(Icons.remove_red_eye)),
                                hintText: "Confirm Password",
                                labelText: "Confirm Password",
                                controller:
                                    registerConfirmPasswordEditingController,
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              CustomButtonWidget(
                                text: "Sign up",
                                onPressed: () async {
                                  try {
                                    if (formRegisterKey.currentState!
                                        .validate()) {
                                      // formRegisterKey.currentState!.save();

                                      loading = true;
                                      setState(() {});
                                      await cubit.signUp();

                                      registerEmailEditingController.clear();
                                      registerFirstNameEditingController
                                          .clear();
                                      registerLastNameEditingController.clear();
                                      registerPasswordEditingController.clear();
                                      registerConfirmPasswordEditingController
                                          .clear();
                                    } else {
                                      registerAutovalidateMode =
                                          AutovalidateMode.always;
                                      setState(() {});
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      showSnackBar(
                                          context, 'Password Is Too Weak');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      showSnackBar(
                                          context, 'Email Already Exist');
                                    }
                                  } catch (e) {
                                    showSnackBar(context, e.toString());
                                  }
                                  loading = false;
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Have An Account.',
                                    style: TextStyle(
                                        fontSize: 18, color: kblueGreyColor),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
