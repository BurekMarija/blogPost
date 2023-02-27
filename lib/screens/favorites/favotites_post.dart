import 'package:blog_posts/redux/data_Redux/actions.dart';
import 'package:blog_posts/redux/favorite_redux/favorite_actions.dart';
import 'package:blog_posts/screens/favorites/favorite_card.dart';
import 'package:blog_posts/screens/home/blog_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import '../../../models/post.dart';
import '../../../redux/all_State.dart';
import '../../shared/constants.dart';

class FavoritePosts extends StatefulWidget {
  const FavoritePosts({super.key});

  @override
  _FavoritePostState createState() => _FavoritePostState();
}

class _FavoritePostState extends State<FavoritePosts> {
  @override
  Widget build(BuildContext context) {
    var postsStete = StoreProvider.of<AllState>(context).state.favoritePosts;
    print(postsStete);
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: backgroundGradient,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: postsStete.length,
              itemBuilder: (context, index) {
                return FavoriteCard(post: postsStete[index]);
              },
            )));
  }
}
