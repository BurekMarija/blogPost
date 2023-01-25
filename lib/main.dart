import 'package:blog_posts/screens/wrapper.dart';
import 'package:blog_posts/services/log.dart';
import 'package:get/get.dart';
import 'models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: LoginService().streamUser,
      initialData: null,
      child: GetMaterialApp(
        title: 'Blog post',
        home:Wrapper(),
      ),
    );
  }
}

// widget class







