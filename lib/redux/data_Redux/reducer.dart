import 'package:blog_posts/redux/data_Redux/actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../models/post.dart';

List<Post> postReducer(List<Post> posts, dynamic action) {
  if (action is SetFirebaseDataAction) {
    return posts;
  }

  if (action is SetFirebasePostAction) {
    /* final docPosts = FirebaseFirestore.instance.collection("posts").doc();

    final json = {
      "id": docPosts.id,
      "name": action.name,
      "content": action.content,
      "url": action.url,
    };
    //Stvori taj post u firebase
    docPosts.set(json);*/
    return posts;
  }

  if (action is UpdateFirebasePostAction) {
    /* print("usao u edit act");
    final post = FirebaseFirestore.instance.collection("posts").doc(action.id);
    post.update(
        {"name": action.name, "content": action.content, "url": action.url});*/
    return posts;
  }

  return posts;
}
