import 'package:blog_posts/redux/Login_redux/reducer.dart';
import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/redux/data_Redux/reducer.dart';

AllState allStateReducer(AllState state, action) {
  return new AllState(
      posts: postReducer(state.posts, action),
      uid: loginReducer(state.uid!, action));
}
