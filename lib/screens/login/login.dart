import 'package:blog_posts/screens/login/register.dart';
import 'package:blog_posts/screens/login/sign_in.dart';
import "package:flutter/material.dart";

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}


//Preusmjeravam na akciju ovisno o postojanju korisnika
class _LoginState extends State<Login> {
  bool showSignIn=true;
  void toggleView(){
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggle:toggleView);
    }
    else{
      return Register(toggle:toggleView);
    }
  }
}
