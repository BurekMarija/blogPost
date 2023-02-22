import 'package:blog_posts/redux/Login_redux/login_state.dart';
import 'package:blog_posts/redux/Login_redux/reducer.dart';
import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/redux/all_reducer.dart';
import 'package:blog_posts/redux/data_Redux/appState.dart';
import 'package:blog_posts/redux/data_Redux/reducer.dart';
import 'package:blog_posts/screens/wrapper.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:redux/redux.dart';

import 'models/post.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    // You need to change Material App to GetMaterialApp
    home: MyApp(),
  ));
}
/* final firebaseStore = Store<dynamic>(
    firebaseDataReducer,
    middleware: [thunkMiddleware],
    initialState: {},
  );*/

class MyApp extends StatelessWidget {
  final AllStore = Store<AllState>(
    allStateReducer,
    middleware: [thunkMiddleware],
    initialState: AllState(uid: "", posts: <Post>[]),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AllState>(
        store: AllStore,
        child: MaterialApp(
          title: 'Blog post',
          home: Wrapper(),
        ));
  }
}
// widget class
