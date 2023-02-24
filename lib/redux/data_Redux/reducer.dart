import 'dart:core';
import 'package:blog_posts/redux/data_Redux/actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../models/post.dart';

List<Post> postReducer(List<Post> posts, dynamic action) {
  if (action is GetFirebaseDataAction) {
    print(posts.length);
    return action.posts;
  }

  if (action is SetFirebasePostAction) {
    List<Post> newPosts = posts;
    newPosts.add(action.post);
    return newPosts;
  }

  if (action is UpdateFirebasePostAction) {
    List<Post> newPosts = posts.map((post) {
      if (post.id == action.post.id) {
        return Post(
          id: post.id,
          name: action.post.name,
          content: action.post.content,
          url: action.post.url,
        );
      } else {
        return post;
      }
    }).toList();
    return newPosts;
  }

  return posts;
}
