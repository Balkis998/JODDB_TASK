import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final SharedPreferences _sharedPreferences;

  AuthCubit(this._auth, this._firestore, this._sharedPreferences)
    : super(AuthInitial());

  Future<void> registerHandler(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      emit(AuthLoading());

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save full name in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      String? token = await userCredential.user!.getIdToken();
      await _saveTokenToSharedPreferences(token ?? '');

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_getFirebaseAuthErrorMessage(e.code)));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> loginHandler(String email, String password) async {
    try {
      emit(AuthLoading());
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String? token = await userCredential.user!.getIdToken();
      await _saveTokenToSharedPreferences(token ?? '');
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_getFirebaseAuthErrorMessage(e.code)));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoading());
      await _auth.signOut();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _saveTokenToSharedPreferences(String token) async {
    await _sharedPreferences.setString('firebase_token', token);
  }

  String _getFirebaseAuthErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'Your password is too weak.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }
}
