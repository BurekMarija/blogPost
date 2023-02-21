import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'login_actions.dart';
import 'login_state.dart';

final FirebaseAuth _log = FirebaseAuth.instance;

ThunkAction<LoginState> thunkLogout() {
  return (Store<LoginState> loginStore) async {
    await _log.signOut();
    loginStore.dispatch(Logout());
  };
}

ThunkAction<LoginState> thunkLogin(String email, String password) {
  return (Store<LoginState> loginStore) async {
    await _log.signInWithEmailAndPassword(email: email, password: password);
    loginStore.dispatch(LoginWithEmail());
  };
}

ThunkAction<LoginState> thunkRegister(String email, String password) {
  return (Store<LoginState> loginStore) async {
    await _log.createUserWithEmailAndPassword(email: email, password: password);
    loginStore.dispatch(RegisterUser());
  };
}
