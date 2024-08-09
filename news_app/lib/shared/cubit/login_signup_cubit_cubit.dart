import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_signup_cubit_state.dart';

class LoginSignupCubitCubit extends Cubit<LoginSignupCubitState> {
  LoginSignupCubitCubit() : super(LoginSignupCubitInitial());
  static LoginSignupCubitCubit get(context) => BlocProvider.of(context);

  late String email;
  late String password;
  late String registerEmail;
  late String registerPassword;
  late String registerConfirmPassword;

  Future<void> signIn() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    log(userCredential.user!.email.toString());
    log(userCredential.user!.displayName.toString());
    emit(LoginState());
  }

  Future<void> signUp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: registerEmail.trim(), password: registerPassword.trim());
    log(user.user!.email.toString());
    emit(SignUpState());
    emit(SignUpState());
  }
}
