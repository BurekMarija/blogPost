import 'dart:core';
import '../../models/post.dart';
import 'favorite_actions.dart';

List<Post> favoriteReducer(List<Post> favoritePosts, dynamic action) {
  if (action is AddPostsToFavorites) {
    print(favoritePosts.toString() + "add to favorites");
    return action.posts;
  }
  if (action is ReturnFavorites) {
    List<Post> newList = favoritePosts;
    print(favoritePosts.toString() + "return favorits");
    //return newList.isNotEmpty ? newList : [];
    return [];
  }
  if (action is GetFavorites) {
    List<Post> newList = favoritePosts;
    return newList.isNotEmpty ? newList : [];
  }

  return favoritePosts;
}
