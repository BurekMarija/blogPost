import '../models/post.dart';

class AllState {
  List<Post> posts;
  final String? uid;
  AllState({required this.posts, required this.uid});
}
