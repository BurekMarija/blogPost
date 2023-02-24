import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/redux/data_Redux/data_thunk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import "package:get/get.dart";
import '../shared/constants.dart';
import 'home/home.dart';

import 'package:redux/redux.dart';

class EditScreen extends StatefulWidget {
  late final inputName;
  final inputContent;
  final inputUrl;
  final id;

  EditScreen(this.inputName, this.inputContent, this.inputUrl, this.id);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String oldName = "";
  String newName = "";
  String newContent = "";
  String newUrl = "";

  @override
  Widget build(BuildContext context) {
    oldName = widget.inputName;
    newName = widget.inputName;
    newContent = widget.inputContent;
    newUrl = widget.inputUrl;
    return Scaffold(
        //Koja kiflica?
        appBar: AppBar(
          title: Text("Edit post $oldName"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: backgroundGradient,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: TextFormField(
                      initialValue: widget.inputName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintStyle: TextStyle(color: Colors.blue),
                        hintText: widget.inputName,
                      ), //                      <--- TextField
                      onChanged: (text) {
                        newName = text;
                      },
                      maxLines: 2,
                      minLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: TextFormField(
                      //
                      keyboardType: TextInputType.multiline,
                      initialValue: widget.inputContent,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintStyle: TextStyle(color: Colors.blue),
                        hintText: widget.inputContent,
                      ), //                     <--- TextField
                      onChanged: (text) {
                        newContent = text;
                      },
                      maxLines: 6,
                      minLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: TextFormField(
                      //
                      initialValue: widget.inputUrl,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintStyle: TextStyle(color: Colors.blue),
                        hintText: widget.inputUrl,
                      ), //                     <--- TextField
                      onChanged: (text) {
                        newUrl = text;
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        //await editPost();

                        StoreProvider.of<AllState>(context, listen: false)
                            .dispatch(thunkEditPost(
                          name: newName,
                          content: newContent,
                          url: newUrl,
                          id: widget.id,
                        ));
                        //  setState(() {
                        //   print("old name $oldName");
                        // });
                        Get.snackbar(
                          'Post edit',
                          'Successfully edited',
                        );
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text(
                        "Edit post",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
