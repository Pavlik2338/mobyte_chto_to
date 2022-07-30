import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobyte_chto_to/auth.dart';
import 'package:mobyte_chto_to/auth_with_google.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    late AuthGoogle google;
    late Auth auth;
    Firebase.initializeApp().then((value) => auth = Auth());
    Firebase.initializeApp().then((value) => google = AuthGoogle());
    on<SignInEvent>((event, emit) {
      auth.signIn(event.email, event.password, event.context);
      emit(AuthSuccess());
    });
    on<SignUpEvent>((event, emit) {
      auth.signUp(event.email, event.password, event.context);
      emit(AuthSuccess());
    });
    on<GoogleSingInEvent>(((event, emit) {
      google.signIn();
      emit(AuthSuccess());
    }));
  }
}
