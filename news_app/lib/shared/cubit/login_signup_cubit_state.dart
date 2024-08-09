part of 'login_signup_cubit_cubit.dart';

@immutable
sealed class LoginSignupCubitState {}

final class LoginSignupCubitInitial extends LoginSignupCubitState {}
final class LoginState extends LoginSignupCubitState {}
final class SignUpState extends LoginSignupCubitState {}



