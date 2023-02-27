import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'login_actions.dart';

String? loginReducer(String state, dynamic action) {
  final FirebaseAuth _log = FirebaseAuth.instance;

  if (action is LoginWithEmail) {
    return _log.currentUser?.uid;
  }

  if (action is Logout) {
    return "";
  }

  if (action is RegisterUser) {
    return _log.currentUser?.uid;
  }

  return state;
}
