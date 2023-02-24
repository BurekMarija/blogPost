import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/redux/data_Redux/actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    AllStore.dispatch(SetFirebasePostAction());
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
    post.update({"name": name, "content": content, "url": url});
    AllStore.dispatch(UpdateFirebasePostAction());
  };
}
