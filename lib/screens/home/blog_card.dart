import 'package:blog_posts/screens/edit_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../models/post.dart';
import '../details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogCard extends StatelessWidget {
  final Post post;
  //final VoidCallback delete;
  //final VoidCallback edit;
  BlogCard ( {required this.post });
  @override
  Widget build(BuildContext context) {
    var diff=post.id;
    return Card(
      color: Colors.white.withOpacity(0),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child:
          Container(
            decoration:BoxDecoration(
                color: Colors.white.withOpacity(0.7)
            ),
            padding: const EdgeInsets.all(12.0),
            child:
          Row(
            children: <Widget>[
              //Image.network(post.url.toString(),
              // width: 100,
              //height: 100,),
              Padding(padding: EdgeInsets.only(left: 5), child:
              Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5), child:
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Text(
                      post.name.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black
                      ) ,),
                  ),),
                ],
              ),),
              Padding(padding: EdgeInsets.only(left:10), child:
              FloatingActionButton.small(
                heroTag: UniqueKey(),
                onPressed: ()async{
                   await deletePost();
                  //ovo treba pomaknuti kasnije

                },
                child: const Icon(Icons.delete),
              ),),
              Padding(padding: EdgeInsets.only(left:10), child:
              FloatingActionButton.small(
                heroTag: UniqueKey(),
                onPressed:(){
                  Get.to(()=>EditScreen(post.name, post.content, post.url, post.id));
                },
                //edit,
                child: const Icon(Icons.edit),
              ),),
              Padding(padding: EdgeInsets.only(left:10), child:
              FloatingActionButton.small(
                heroTag:UniqueKey(),
                onPressed:(){Get.to(()=>PostDetails(post.name, post.content, post.url));},
                child: const Icon(Icons.info),
              ),),


            ],

          ),)

    );
  }
  Future deletePost() async{
    final collection=FirebaseFirestore.instance.collection("posts");
    await collection.doc(post.id).delete();
  }

}
