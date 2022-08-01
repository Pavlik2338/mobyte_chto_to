part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;
  String? userName;
  SignInEvent(
      {required this.email,
      required this.password,
      required this.context,
      this.userName});
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String userName;
  final BuildContext context;

  SignUpEvent(
      {required this.email,
      required this.password,
      required this.context,
      required this.userName});
}

class SingOutEvent extends AuthEvent {}

class ResetPasswordEvent extends AuthEvent {
  final String email;
  final BuildContext context;
  ResetPasswordEvent({required this.email, required this.context});
}

class GoogleSingInEvent extends AuthEvent {}
//
// class LoginSubmitted extends AuthEvent {
//   final String email;
//   final String password;
//   const LoginSubmitted( this.email, this.password);
// }