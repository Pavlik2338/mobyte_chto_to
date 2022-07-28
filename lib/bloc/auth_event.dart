part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SingInEvent extends AuthEvent {
  final String email;
  final String password;
  SingInEvent({required this.email, required this.password});
}

class SingUpEvent extends AuthEvent {
  final String email;
  final String password;
  SingUpEvent({required this.email, required this.password});
}

class LoadingState extends AuthInitial {}
