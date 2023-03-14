import 'package:blog_posts/redux/all_State.dart';
import 'package:blog_posts/screens/edit_post.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../models/post.dart';
import '../../redux/favorite_redux/favorite_thunk.dart';
import '../details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogCard extends StatelessWidget {
  final Post post;
  const BlogCard({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    var liked = StoreProvider.of<AllState>(context).state.favoritePosts;
    bool isLiked = false;
    for (var i = 0; i < liked.length; i++) {
      if (post.id == liked[i].id) {
        isLiked = true;
        break;
      }
    }
    return Card(
        elevation: 0,
        color: Colors.transparent,
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 2),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text(
                          post.name.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: FloatingActionButton.small(
                  heroTag: UniqueKey(),
                  onPressed: () async {
                    await deletePost();
                    //ovo treba pomaknuti kasnije
                  },
                  child: const Icon(Icons.delete),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: FloatingActionButton.small(
                  heroTag: UniqueKey(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditScreen(
                                post.name, post.content, post.url, post.id)));
                  },

                  //edit,
                  child: const Icon(Icons.edit),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: FloatingActionButton.small(
                  heroTag: UniqueKey(),
                  onPressed: () {
                    Get.to(
                        () => PostDetails(post.name, post.content, post.url));
                  },
                  child: const Icon(Icons.info),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: FavoriteButton(
                  isFavorite: isLiked,
                  valueChanged: (_isFavorite) {
                    StoreProvider.of<AllState>(context).dispatch(thunkFavorite(
                        Post(
                            name: post.name,
                            content: post.content,
                            url: post.url,
                            id: post.id),
                        _isFavorite));
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Future deletePost() async {
    final collection = FirebaseFirestore.instance.collection("posts");
    await collection.doc(post.id).delete();
  }
}
