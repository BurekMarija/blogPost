import 'package:blog_posts/redux/Login_redux/login_reducer.dart';
import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/redux/all_reducer.dart';
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
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final AllStore = Store<AllState>(
    allStateReducer,
    middleware: [thunkMiddleware],
    initialState: AllState(uid: "", posts: [], favoritePosts: []),
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
