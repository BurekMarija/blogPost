import 'package:blog_posts/redux/Login_redux/reducer.dart';
import 'package:blog_posts/screens/login/register.dart';
import 'package:blog_posts/services/log.dart';
import 'package:blog_posts/shared/loading.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:redux/redux.dart';

import '../../models/user.dart';
import '../../redux/Login_redux/login_actions.dart';
import '../../redux/Login_redux/login_state.dart';
import '../../shared/constants.dart';
import '../home/home.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn({required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}
//Ulogiravanje anonimno
class _SignInState extends State<SignIn> {
  final loginStore = Store<LoginState>(
    loginReducer,
    initialState: LoginState(uid: ''),
  );
  //final LoginService _log= LoginService();
  bool loading=false;
  final _regkey=GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";

  @override
  Widget build(BuildContext context) {
    return loading? Loading():

    Scaffold(
      appBar: AppBar(title: Text("Sign in"),
      actions: <Widget>[
        FloatingActionButton.extended(
          onPressed: (){widget.toggle();},
          icon: Icon(Icons.people),
          label: Text("Register"),
        backgroundColor: Colors.transparent,)
      ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: backgroundGradient,
        child:
        Padding(padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.7)
            ),
            margin: EdgeInsets.fromLTRB(20, 50, 20, 180),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  TextButton(onPressed: ()async{ if(_regkey.currentState!.validate())
                  {
                    /*setState(() {
                      loading=true;
                    });
                    dynamic result= await _log.signIn(email, password);
                    if(result== null){
                      setState(() {
                        loading= false;
                        error="Wrong email or password";
                      });
                    }*/
                    loginStore.dispatch(LoginWithEmail(email:email, password:password));

                    print(loginStore.state.uid.toString());
                    print("EVO ME");
                    Get.to(()=>Home());
                  }
                  },
                    child:Text("Sign in", style: TextStyle(color: Colors.white),),
                    style: TextButton.styleFrom( backgroundColor: Colors.lightBlue,),),
                  SizedBox(height: 10,),
                  Text(error,
                    style: TextStyle(color: Colors.red,
                        fontSize: 20),)
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}

