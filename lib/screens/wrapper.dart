import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/screens/home/home.dart';
import 'package:blog_posts/screens/login/login.dart';
import 'package:blog_posts/screens/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AllState, AllState>(
      converter: (store) => store.state,
      builder: (BuildContext context, AllState state) {
        if (state.uid.toString() == '') {
          return Login();
        } else if (state.uid == null) {
          return Login();
        } else {
          return Home();
        }
      },
    );
  }
}
