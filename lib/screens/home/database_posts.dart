import 'package:blog_posts/redux/data_Redux/actions.dart';
import 'package:blog_posts/screens/home/blog_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import "package:provider/provider.dart";
import 'package:redux/redux.dart';
import '../../models/post.dart';
import '../../redux/all_State.dart';

class DatabasePosts extends StatefulWidget {
  @override
  _DatabasePostsState createState() => _DatabasePostsState();
}

class _DatabasePostsState extends State<DatabasePosts> {
  List<Post> _posts = [];
  bool _initial = false;

  @override
  Widget build(BuildContext context) {
    //_posts=StoreProvider.of<AllState>(context).dispatch(thunkGetPosts());
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          _posts = snapshot.data!.docs.map((doc) {
            return postFromDocument(doc.data() as Map<String, dynamic>);
          }).toList();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }

        //Setam stanje na početku
        if (_initial == false && _posts.isNotEmpty) {
          StoreProvider.of<AllState>(context)
              .dispatch(GetFirebaseDataAction(_posts));
          _initial = true;
        }

        return Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return BlogCard(post: _posts[index]);
            },
          ),
        );
      },
    );
  }
}
