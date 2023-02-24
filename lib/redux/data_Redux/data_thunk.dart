import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/redux/data_Redux/actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../../models/post.dart';

ThunkAction<AllState> thunkNewPost(
    {required String name, required String content, required String url}) {
  return (Store<AllState> AllStore) async {
    print("Jel ti vidiš da sam tu?");
    final docPosts = FirebaseFirestore.instance.collection("posts").doc();

    final json = {
      "id": docPosts.id,
      "name": name,
      "content": content,
      "url": url,
    };
    //Stvori taj post u firebase
    await docPosts.set(json);
    AllStore.dispatch(SetFirebasePostAction(
        post: Post(name: name, content: content, url: url, id: docPosts.id)));
  };
}

ThunkAction<AllState> thunkEditPost(
    {required String name,
    required String content,
    required String url,
    required String id}) {
  return (Store<AllState> AllStore) async {
    print("usao u edit act");
    final post = FirebaseFirestore.instance.collection("posts").doc(id);
    await post.update({"name": name, "content": content, "url": url});
    AllStore.dispatch(UpdateFirebasePostAction(
        post: Post(name: name, content: content, url: url, id: id)));
  };
}
/*
ThunkAction<AllState> thunkGetPosts() {
  return (Store<AllState> AllStore) async {
    print("Jel ti vidiš da sam tu?");
    final docPosts = FirebaseFirestore.instance.collection("posts").doc();
    var snapshot = await docPosts.get();
    List<Post> posts = [];
    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data();
      data?.forEach((key, value) {
        Post post = Post(
          id: value['id'],
          name: value['name'],
          content: value['content'],
          url: value['url'],
        );
        posts.add(post);
        print(post.name);
      });
    }
    print(posts);
    AllStore.dispatch(GetFirebaseDataAction(posts));
  };
}*/
