import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth;

  AuthCubit(this._auth) : super(AuthInitial());

  Future<void> registerHandler(String email, String password) async {
    try {
      emit(AuthLoading());
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> loginHandler(String email, String password) async {
    try {
      emit(AuthLoading());
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    emit(AuthInitial());
  }
}
