import 'package:blog_posts/redux/Login_redux/login_reducer.dart';
import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/redux/data_Redux/reducer.dart';
import 'package:blog_posts/redux/favorite_redux/favorite_reducer.dart';

AllState allStateReducer(AllState state, action) {
  return AllState(
      posts: postReducer(state.posts, action),
      uid: loginReducer(state.uid!, action),
      favoritePosts: favoriteReducer(state.favoritePosts, action));
}
