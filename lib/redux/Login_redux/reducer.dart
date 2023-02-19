import 'package:firebase_auth/firebase_auth.dart';

import 'login_actions.dart';
import 'login_state.dart';

LoginState loginReducer(LoginState state, dynamic action) {
  final FirebaseAuth _log=FirebaseAuth.instance;

  if(action is LoginWithEmail){
    final email = action.email;
    final password = action.password;

    try {
      _log.signInWithEmailAndPassword(email: email, password: password);
      return LoginState(uid: _log.currentUser?.uid);
    }catch(error){
      return LoginState(uid: null);
    }
  }

  if(action is Logout){
    _log.signOut();
    return LoginState(uid: null);
  }

  if(action is RegisterUser){
    final email = action.email;
    final password = action.password;

    try{
      _log..createUserWithEmailAndPassword(email: email, password: password);
      return LoginState(uid: _log.currentUser?.uid);
    }catch(error){
      return LoginState(uid: null);
    }
  }

      return state;
  }
