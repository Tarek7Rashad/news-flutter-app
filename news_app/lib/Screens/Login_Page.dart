import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/Screens/Home_Page.dart';
import 'package:news_app/Widgets/customButtonWidget.dart';
import 'package:news_app/Widgets/customTextFormField.dart';
import 'package:news_app/shared/components/constant.dart';
import 'package:news_app/shared/components/snackBar.dart';
import 'package:news_app/shared/cubit/login_signup_cubit_cubit.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool obscureText2 = true;

bool loading = false;

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginSignupCubitCubit, LoginSignupCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginSignupCubitCubit cubit = LoginSignupCubitCubit.get(context);
        return SafeArea(
          child: ModalProgressHUD(
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
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Row(
                  children: [
                    Image.asset(
                      'assets/images/Moghtareb-removebg-preview.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'MOGHTAREB',
                      style: TextStyle(fontSize: 16, color: kblueColor),
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                child: Form(
                  autovalidateMode: autovalidateMode,
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 30, bottom: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
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
                                'SIGN IN',
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
                                  return "Invalid Email";
                                } else {
                                  // log(value);
                                }
                                return null;
                              },
                              onChanged: (value) {
                                cubit.email = value;
                              },
                              hintText: "Email",
                              labelText: "Email",
                              controller: emailEditingController,
                            ),
                            SizedBox(
                              height: height * .001,
                            ),
                            CustomTextFormFieldWidget(
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Invalid Password";
                                } else {
                                  // log(value);
                                }
                                return null;
                              },
                              onChanged: (value) {
                                cubit.password = value;
                              },
                              obscureText: obscureText2,
                              suffix: IconButton(
                                  onPressed: () {
                                    if (obscureText2 &&
                                        passwordEditingController
                                            .text.isNotEmpty) {
                                      obscureText2 = false;
                                      setState(() {});
                                    } else {
                                      obscureText2 = true;
                                      setState(() {});
                                    }
                                  },
                                  icon: const Icon(Icons.remove_red_eye)),
                              hintText: "Password",
                              labelText: "Password",
                              controller: passwordEditingController,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: kblueGreyColor,
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null) {
                                        rememberMe = value;
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                            CustomButtonWidget(
                                text: "Sign in",
                                onPressed: () async {
                                  if (rememberMe == true) {
                                    // rememberMeFun();
                                    setState(() {
                                      log('from true login ${rememberMe.toString()}');
                                    });
                                  }
                                  try {
                                    if (formKey.currentState!.validate()) {
                                      loading = true;
                                      setState(() {});

                                      await cubit.signIn();
                                      Navigator.pushReplacementNamed(
                                          context, HomePage.id);
                                      emailEditingController.clear();
                                      passwordEditingController.clear();
                                    } else {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                      setState(() {});
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                                      showSnackBar(context,
                                          'email or password is invalid');
                                    } else if (e.code == 'wrong-password') {
                                      showSnackBar(context,
                                          'wrong password provided for that user');
                                    } else if (!RegExp(
                                            r'^[\w-]+(\.[\w-]+)*@gmail\.com$')
                                        .hasMatch(cubit.email)) {
                                      showSnackBar(context,
                                          'enter valid email or password');
                                    } else {
                                      showSnackBar(context, 'wrong password');
                                    }
                                  } catch (e) {
                                    log(e.toString());
                                    showSnackBar(context, 'Error');
                                  }
                                  loading = false;
                                  setState(() {});
                                }),
                            SizedBox(
                              height: height * .001,
                            ),
                            // TextButton(
                            //     onPressed: () {
                            //       Navigator.of(context).pushReplacementNamed(
                            //           LoginAsAdminScreen.id);
                            //     },
                            //     child: const Text(
                            //       "i'm admin",
                            //       style: TextStyle(
                            //           fontSize: 18, color: kblueGreyColor),
                            //     )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                          fontSize: 18, color: kblueGreyColor),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      // Navigator.of(context)
                                      //     .pushNamed(RegisterPage.id);
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 18, color: kblueGreyColor),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
