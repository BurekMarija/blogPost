import 'package:blog_posts/screens/home/home.dart';
import 'package:blog_posts/screens/login/login.dart';
import 'package:blog_posts/screens/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog_posts/models/user.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/Login_redux/login_state.dart';
import '../redux/Login_redux/reducer.dart';

class Wrapper extends StatelessWidget {
 /* final store = Store<LoginState>(
    loginReducer,
    initialState: LoginState(uid: ''),
  );*/
  @override
  Widget build(BuildContext context) {
    return StoreConnector<LoginState, LoginState>(
      converter: (store) => store.state,
      builder: (BuildContext context, LoginState user) {
        print("${user.uid} Evo kao user");

        if (user.uid == '') {
          return Login();
        } else {
          return Home();
        }
      },
    );
  }
}
