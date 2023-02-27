import '../models/post.dart';

class AllState {
  List<Post> posts;
  List<Post> favoritePosts;
  final String? uid;
  AllState(
      {required this.posts, required this.uid, required this.favoritePosts});
}
