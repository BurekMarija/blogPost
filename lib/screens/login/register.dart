import 'package:blog_posts/shared/loading.dart';
import 'package:flutter/material.dart';
import '../../services/log.dart';
import '../../shared/constants.dart';

class Register extends StatefulWidget {
final Function toggle;
Register({required this.toggle});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final LoginService _log= LoginService();
  bool loading=false;
  final _regkey=GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";
  @override
  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold(
      appBar: AppBar(title: Text("Register",
      ),

        actions: <Widget>[
          FloatingActionButton.extended(
            onPressed: (){widget.toggle();},
            icon: Icon(Icons.people),
            label: Text("Sign in"),
          backgroundColor: Colors.transparent,)
        ],),
      resizeToAvoidBottomInset: false,
      body:
      Container(
        decoration: backgroundGradient,
        child:
        Padding(padding: EdgeInsets.all(20),
          child: Container(
            decoration:BoxDecoration(
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
                  TextButton(onPressed: ()async{
                    if(_regkey.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      dynamic result= await _log.register(email, password);
                      if(result== null){
                        setState(() {
                          loading=false;
                          error="Please get right email";
                        });
                      }
                    }
                  },
                    child:Text("Register", style: TextStyle(color: Colors.white),),
                    style: TextButton.styleFrom( backgroundColor: Colors.lightBlue,),
                  ),

                  SizedBox(height: 10,),
                  Text(error,
                    style: TextStyle(color: Colors.red,
                        fontSize: 20),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
