import 'package:blog_posts/redux/actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post.dart';


dynamic firebaseDataReducer(dynamic data, dynamic action)async{
  if(action is SetFirebaseDataAction){
    // Convert each document to a Post object
    List<Post> posts = action.data.map((document) => postFromDocument(document)).toList();
    return posts;
  }

  if(action is SetFirebasePostAction){
    final docPosts=FirebaseFirestore.instance.collection("posts").doc();

    final json= {
      "id": docPosts.id,
      "name": action.name,
      "content": action.content,
      "url": action.url,
    };
    //Stvori taj post u firebase
     docPosts.set(json);
    return data;
  }

  if(action is UpdateFirebasePostAction)  {
  final post=FirebaseFirestore.instance.collection("posts").doc(action.id);
  post.update({"name": action.name, "content": action.content, "url": action.url});
  }

  if(action is GetPostNameAction){
    final post=await FirebaseFirestore.instance.collection("posts").doc(action.id).get();
    return post.data()!['name'];

  }

  return data;


}