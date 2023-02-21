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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<LoginState, LoginState>(
      converter: (store) => store.state,
      builder: (BuildContext context, LoginState user) {
        print(user.uid.toString() +"Evo kao user");
        if (user.uid.toString() == '' ) {
          return Login();
        } else if(user.uid==null){
          return Login();
        }else{
          return Home();
        }
      },
    );
  }
}
