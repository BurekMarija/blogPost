import 'package:blog_posts/screens/home/home.dart';
import 'package:blog_posts/screens/login/login.dart';
import 'package:blog_posts/screens/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog_posts/models/user.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user= Provider.of<User>(context);
    if (user==null){
      return Login();
    }
    else{
     return Home();
    }
  }
}
