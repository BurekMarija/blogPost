import '../../models/post.dart';

class GetFirebaseDataAction {
  final List<Post> posts;

  GetFirebaseDataAction(this.posts);
}

class SetFirebasePostAction {
  final Post post;
  SetFirebasePostAction({required this.post});
}

class UpdateFirebasePostAction {
  final Post post;
  UpdateFirebasePostAction({required this.post});
}
