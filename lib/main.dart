import 'package:blog_posts/redux/Login_redux/login_state.dart';
import 'package:blog_posts/redux/Login_redux/reducer.dart';
import 'package:blog_posts/redux/reducer.dart';
import 'package:blog_posts/screens/wrapper.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:redux/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    // You need to change Material App to GetMaterialApp
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final firebaseStore = Store<dynamic>(
    firebaseDataReducer,
    initialState: {},
  );
  final loginStore = Store<LoginState>(
    loginReducer,
    middleware: [thunkMiddleware],
    initialState: LoginState(uid: ''),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<dynamic>(
      store: firebaseStore,
      child: StoreProvider<LoginState>(
        store: loginStore,
        child: MaterialApp(
          title: 'Blog post',
          home: Wrapper(),
        ),
      ),
    );
  }
}
// widget class
