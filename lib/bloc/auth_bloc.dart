import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobyte_chto_to/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    AuthService auth = AuthService();
    on<SingUpEvent>((event, emit) async {
      await auth.SingUp(event.email, event.password);
      emit(AuthInitial(success: true));
    });
    on<SingInEvent>((event, emit) async {
      await auth.singIn(event.email, event.password);
      emit(AuthInitial(success: true));
    });
  }
}
