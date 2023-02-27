import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/redux/data_Redux/actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../../models/post.dart';

ThunkAction<AllState> thunkNewPost(
    {required String name, required String content, required String url}) {
  return (Store<AllState> AllStore) async {
    final docPosts = FirebaseFirestore.instance.collection("posts").doc();

    final json = {
      "id": docPosts.id,
      "name": name,
      "content": content,
      "url": url,
    };
    //Stvori taj post u firebase
    try {
      await docPosts.set(json);
      AllStore.dispatch(SetFirebasePostAction(
          post: Post(name: name, content: content, url: url, id: docPosts.id)));
      Get.snackbar(
        'New post',
        'Successfully added',
      );
    } catch (e) {
      Get.snackbar(
        'New post',
        'Error $e occurred',
        backgroundColor: Colors.redAccent,
      );
    }
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
    try {
      await post.update({"name": name, "content": content, "url": url});
      AllStore.dispatch(UpdateFirebasePostAction(
          post: Post(name: name, content: content, url: url, id: id)));
      Get.snackbar(
        'Post edit',
        'Successfully edited',
      );
    } catch (e) {
      Get.snackbar(
        'Post edit',
        'Error $e occurred',
        backgroundColor: Colors.redAccent,
      );
    }
  };
}
