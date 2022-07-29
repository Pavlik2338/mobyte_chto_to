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
  final BuildContext context;
  String? userName;
  SignUpEvent(
      {required this.email,
      required this.password,
      required this.context,
      required this.userName});
}
