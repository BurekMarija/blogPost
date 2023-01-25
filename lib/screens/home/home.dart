import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import '../../models/post.dart';
import '../new_post.dart';
import 'package:http/http.dart' as http;
import "package:blog_posts/services/database.dart";
import "package:provider/provider.dart";
import 'package:blog_posts/screens/home/database_posts.dart';
import '../../services/log.dart';

class Home extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  final _log=LoginService();
  List<dynamic> postsData=[];

  ValueNotifier<String> inputName=ValueNotifier<String>("");
  ValueNotifier<String> inputContent=ValueNotifier<String>("");
  ValueNotifier<String> inputUrl=ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return
      StreamProvider<List<Post>>.value(
        value: DatabaseService(uid: '').posts,
        initialData: [],
        child: Scaffold(
        appBar: AppBar(
          title: Text("Blog post App"),
              actions: <Widget>[
                FloatingActionButton.extended(
                  heroTag: UniqueKey(),
                  onPressed: ()async {
                  await _log.signOut();
                },
                  icon: Icon(Icons.logout),
                  label: Text("Logout"),
                  backgroundColor: Colors.blue[600],
                ),
              ],
        ),
        body:
            SingleChildScrollView(child:
            Column(
              children: [
                SizedBox(height: 20,),
                SingleChildScrollView(child: DatabasePosts(),),
                SizedBox(height: 10,),

                Padding(padding: EdgeInsets.only(top: 20),),
                Text("Add new post",
                style: TextStyle(fontSize: 20), ),
                TextButton(
                  onPressed: () {
                    Get.to(NewScreen());
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),),

    ),
      );

  }

}
