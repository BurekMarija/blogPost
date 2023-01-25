import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class EditScreen extends StatelessWidget {
  final  inputName;
  final  inputContent;
  final  inputUrl;
  final id;
  String oldName="";
  String newName="";
  String newContent="";
  String newUrl="";
  EditScreen (this.inputName, this.inputContent, this.inputUrl, this.id);
  @override
  Widget build(BuildContext context) {
    oldName=inputName;
    newName=inputName;
    newContent=inputContent;
    newUrl=inputUrl;
    return Scaffold(
      appBar: AppBar(title: Text("Edit post "+ inputName)),
      body:
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: backgroundGradient,
            child: SingleChildScrollView(
              child:  Container(
                  margin: new EdgeInsets.all(20.0),
                  child:Column(
                    children: [
                      Padding(padding: EdgeInsets.all(6),
                        child:TextFormField(
                        initialValue: inputName,
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
                          hintText: inputName,
                        ),//                      <--- TextField
                        onChanged: (text) {
                          newName = text;
                        },
                        maxLines: 2,
                        minLines: 1,
                      ) ,),
                      Padding(padding: EdgeInsets.all(6), child:
                      TextFormField( //
                        keyboardType: TextInputType.multiline,
                        initialValue: inputContent,
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
                          hintText: inputContent,
                        ),//                     <--- TextField
                        onChanged: (text) {
                          newContent= text;
                        },
                        maxLines: 6,
                        minLines: 1,
                      ),),
                      Padding(padding: EdgeInsets.all(6), child:
                      TextFormField( //
                        initialValue: inputUrl,
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
                          hintText: inputUrl,
                        ),//                     <--- TextField
                        onChanged: (text) {
                          newUrl=text;
                        },
                      ),),

                      TextButton(onPressed:()async{
                        await editPost();
                      },
                          child: Text("Edit post",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),)),],
                  ),
                ),
            ),
          )


    );
  }

  Future editPost() async{
    final post=FirebaseFirestore.instance.collection("posts").doc(id);
      post.update({"name": newName, "content": newContent, "url": newUrl});

  }

}