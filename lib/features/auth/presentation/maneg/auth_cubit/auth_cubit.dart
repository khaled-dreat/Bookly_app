import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/constant/app_icons.dart';
import '../../../../../core/utils/language/app_lang_key.dart';
import '../../../data/model/m_auth_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ModelAuthUser userAuth = ModelAuthUser();
  String currentPass = '';

  void setCurrentPass(String value) {
    currentPass = value;
  }

  // ******************** Eye ********************
  IconData icon = AppIcons.showPass;
  bool isNotShowPass = true;

  void changeIcon() {
    if (isNotShowPass) {
      isNotShowPass = false;
      icon = AppIcons.noShowPass;
    } else {
      isNotShowPass = true;
      icon = AppIcons.showPass;
    }
    // notifyListeners();
  }

  // * Register
  Future<void> authMethod({bool isSignIn = true}) async {
    try {
      emit(AuthLoading());
      UserCredential resultUser = isSignIn
          ? await firebaseAuth.signInWithEmailAndPassword(
              email: userAuth.email!, password: userAuth.password!)
          : await firebaseAuth.createUserWithEmailAndPassword(
              email: userAuth.email!, password: userAuth.password!);
      if (resultUser.user != null) {
        emit(AuthSuccess(user: resultUser.user!));
      } else {
        emit(AuthFailure(errMessage: AppLangKey.notAccount));
      }
    } on SocketException {
      emit(AuthFailure(errMessage: AppLangKey.noInternet));
    } on FirebaseAuthException catch (error) {
      emit(AuthFailure(errMessage: error.message ?? ""));
    } catch (error) {
      emit(AuthFailure(errMessage: error.toString()));
    }
  }
}
