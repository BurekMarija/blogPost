import 'dart:convert';

import 'package:blog_posts/redux/favorite_redux/favorite_reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/post.dart';
import '../all_State.dart';
import 'package:redux/redux.dart';

import 'favorite_actions.dart';

ThunkAction<AllState> thunkFavorite(Post post, bool isLiked) {
  return (Store<AllState> AllStore) async {
    print(post.name.toString() + " " + post.content.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.remove("posts");
    String? encoded = prefs.getString('posts');
    List<Post> posts = (encoded != null)
        ? List<Post>.from(
            jsonDecode(encoded).map((item) => Post.fromJson(item)))
        : <Post>[];
    if (isLiked) {
      posts.add(post);
      final String encodedLast = jsonEncode(posts);
      await prefs.setString('posts', encodedLast);
    } else {
      posts.removeWhere((postJ) => postJ.id == post.id);
      final String encodedLast = jsonEncode(posts);
      await prefs.setString('posts', encodedLast);
    }

    AllStore.dispatch(AddPostsToFavorites(posts: posts));
  };
}

ThunkAction<AllState> thunkGetFavorite() {
  return (Store<AllState> AllStore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encoded = prefs.getString('posts');
    List<Post> posts = (encoded != null)
        ? List<Post>.from(
            jsonDecode(encoded).map((item) => Post.fromJson(item)))
        : <Post>[];

    AllStore.dispatch(AddPostsToFavorites(posts: posts));
  };
}
