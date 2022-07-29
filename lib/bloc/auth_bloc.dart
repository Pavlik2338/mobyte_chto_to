import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobyte_chto_to/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    late Auth auth;
    AuthEvent event;
    Firebase.initializeApp().then((value) => auth = Auth());
    on<SignInEvent>((event, emit) {
      auth.signIn(event.email, event.password, event.context);
      emit(AuthSuccess());
    });
    on<SignUpEvent>((event, emit) {
      auth.signUp(event.email, event.password, event.context);
      emit(AuthSuccess());
    });
  }
}
