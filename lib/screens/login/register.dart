import 'package:blog_posts/shared/loading.dart';
import 'package:flutter/material.dart';
import '../../services/log.dart';

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
      appBar: AppBar(title: Text("Register"),

        actions: <Widget>[
          IconButton(onPressed: (){widget.toggle();}, icon: Icon(Icons.people), )
        ],),
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
                child:Text("Register"),),
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
