import 'dart:math';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:mobyte_chto_to/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    Firebase.initializeApp().then((value) => auth = Auth());
  }
  late Auth auth;
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield LoadingState();
    try {
      if (event is SignInEvent) {
        await auth.SignIn(event.email, event.password);
        yield AuthInitial(success: true);
      }
      if (event is SignUpEvent) {
        await auth.SignUp(event.email, event.password);
        yield AuthInitial(success: true);
      }
    } on AuthException catch (exception) {
      yield AuthInitial(error: true, errorText: exception.caption);
    }
  }
}
