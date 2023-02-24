import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../all_State.dart';
import 'login_actions.dart';

final FirebaseAuth _log = FirebaseAuth.instance;

ThunkAction<AllState> thunkLogout() {
  return (Store<AllState> AllStore) async {
    await _log.signOut();
    AllStore.dispatch(Logout());
  };
}

ThunkAction<AllState> thunkLogin(String email, String password) {
  return (Store<AllState> AllStore) async {
    await _log.signInWithEmailAndPassword(email: email, password: password);
    AllStore.dispatch(LoginWithEmail());
  };
}

ThunkAction<AllState> thunkRegister(String email, String password) {
  return (Store<AllState> AllStore) async {
    await _log.createUserWithEmailAndPassword(email: email, password: password);
    AllStore.dispatch(RegisterUser());
  };
}
