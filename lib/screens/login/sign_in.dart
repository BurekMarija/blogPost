import 'package:blog_posts/screens/login/register.dart';
import 'package:blog_posts/services/log.dart';
import 'package:blog_posts/shared/loading.dart';
import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn({required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}
//Ulogiravanje anonimno
class _SignInState extends State<SignIn> {
  final LoginService _log= LoginService();
  bool loading=false;
  final _regkey=GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      appBar: AppBar(title: Text("Sign in"),
      actions: <Widget>[
        IconButton(onPressed: (){widget.toggle();}, icon: Icon(Icons.people), )
      ],
      ),
      body: Padding(padding: EdgeInsets.all(20),
        child: Form(
          key: _regkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (text){
                  setState(() {
                    email=text;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                validator:(text) {
                  if (text!.length < 6 || text.isEmpty) {
                    return 'Insert new password 6+ signs';
                  }
                  return null;
                },
                obscureText: true,
                onChanged: (text){
                  setState(() {
                    password=text;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: ()async{ if(_regkey.currentState!.validate()){
                setState(() {
                  loading=true;
                });
               dynamic result= await _log.signIn(email, password);
               if(result== null){
                 setState(() {
                   loading= false;
                   error="Wrong email or password";
                 });
               }
              }
              },
                  child:Text("Sign In"),),
              SizedBox(height: 10,),
              Text(error,
                style: TextStyle(color: Colors.red,
                fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}

