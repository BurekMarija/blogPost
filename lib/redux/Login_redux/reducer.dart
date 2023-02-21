import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'login_actions.dart';
import 'login_state.dart';

LoginState loginReducer(LoginState state, dynamic action) {
  final FirebaseAuth _log = FirebaseAuth.instance;

  if (action is LoginWithEmail) {
    //ti frende seliš
    /* final email = action.email;
    final password = action.password;
      _log.signInWithEmailAndPassword(email: email, password: password);*/
    print(_log.currentUser?.uid.toString());
    return LoginState(uid: _log.currentUser?.uid);
  }

  if (action is Logout) {
    //A bogami i ti
    // _log.signOut();
    return LoginState(uid: "");
  }

  if (action is RegisterUser) {
    /*Još si tu?
    final email = action.email;
    final password = action.password;
     _log.createUserWithEmailAndPassword(email: email, password: password);*/

    return LoginState(uid: _log.currentUser?.uid);
  }

  return state;
}
