import 'package:blog_posts/screens/home/blog_card.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import '../../models/post.dart';

class DatabasePosts extends StatefulWidget {

  @override
  State<DatabasePosts> createState() => _DatabasePostsState();
}

class _DatabasePostsState extends State<DatabasePosts> {
  @override
  Widget build(BuildContext context) {
    final posts=Provider.of<List<Post>>(context);
    posts.forEach((post) {print(post.name); });
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (context, index){
            return BlogCard(post: posts[index]);
          }
      )  ,
    );

  }
}
