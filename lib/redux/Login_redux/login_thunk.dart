import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../all_State.dart';
import 'login_actions.dart';

final FirebaseAuth _log = FirebaseAuth.instance;

ThunkAction<AllState> thunkLogout() {
  return (Store<AllState> AllStore) async {
    try {
      await _log.signOut();
      AllStore.dispatch(Logout());
    } catch (e) {
      Get.snackbar(
        'Error in logout',
        'Error $e occurred ',
        backgroundColor: Colors.redAccent,
      );
    }
  };
}

ThunkAction<AllState> thunkLogin(String email, String password) {
  return (Store<AllState> AllStore) async {
    try {
      await _log.signInWithEmailAndPassword(email: email, password: password);
      AllStore.dispatch(LoginWithEmail());
    } catch (e) {
      Get.snackbar(
        'Error in login',
        'Error $e occurred ',
        backgroundColor: Colors.redAccent,
      );
    }
  };
}

ThunkAction<AllState> thunkRegister(String email, String password) {
  return (Store<AllState> AllStore) async {
    try {
      await _log.createUserWithEmailAndPassword(
          email: email, password: password);
      AllStore.dispatch(RegisterUser());
    } catch (e) {
      Get.snackbar(
        'Error in register',
        'Error $e occurred ',
        backgroundColor: Colors.redAccent,
      );
    }
  };
}
