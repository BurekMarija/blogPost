import 'package:blog_posts/models/post.dart';
import 'package:blog_posts/screens/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import '../shared/constants.dart';

class NewScreen extends StatelessWidget {
  final controlerName=TextEditingController();
  final controlerContent=TextEditingController();
  final controlerUrl=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  NewScreen ();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New post")),
      body:
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: backgroundGradient,
              child: SingleChildScrollView(child:Form(
                key: _formKey,
                child:
                Container(
                  margin: new EdgeInsets.all(20.0),
                  child:
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.all(6), child:
                      TextFormField( //
                        keyboardType: TextInputType.multiline,
                        validator:(text) {
                          if (text!.length < 2 || text.isEmpty) {
                            return 'Please insert name of the post';
                          }
                          return null;
                        },
                        controller: controlerName,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.blueAccent,),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintStyle: TextStyle(color: Colors.blue),
                            hintText: "Post name"
                        ),//                     <--- TextField
                        maxLines: 6,
                        minLines: 1,
                      ),),
                      Padding(padding: EdgeInsets.all(6), child:
                      TextFormField( //
                        controller: controlerContent,
                        validator:(text) {
                          if (text!.length < 10 || text.isEmpty) {
                            return 'Please insert content of the post (more then 10 chars)';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.blueAccent,),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintStyle: TextStyle(color: Colors.blue),
                            hintText: "Post content"
                        ),
                        maxLines: 6,
                        minLines: 1,
                      ),),
                      Padding(padding: EdgeInsets.all(6), child:
                      TextFormField( //
                        controller: controlerUrl,
                        validator:(text) {
                          if (text!.length < 10 || text.isEmpty) {
                            return 'Please insert valid url';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.blueAccent,),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintStyle: TextStyle(color: Colors.blue),
                            hintText: "Url of picture"
                        ),
                        maxLines: 6,
                        minLines: 1,
                      ),),
                      TextButton(onPressed: (){ createPost();
                      Get.to(()=>Home());
                      },
                          child: Text("Unesi",
                          style: TextStyle(fontSize: 20,
                          color: Colors.white),),
                      ),
                    ],
                  ),),
              ) ,),
            )



    );
  }


  Future createPost() async{
    final docPosts=FirebaseFirestore.instance.collection("posts").doc();

    final json= {
      "id": docPosts.id,
      "name": controlerName.text,
      "content": controlerContent.text,
      "url": controlerUrl.text,
    };
    //Stvori taj post u firebase
    await docPosts.set(json);
    Get.to(Home());
  }
}