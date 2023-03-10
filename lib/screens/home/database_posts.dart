import 'package:blog_posts/redux/data_Redux/actions.dart';
import 'package:blog_posts/screens/home/blog_card.dart';
import 'package:blog_posts/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/post.dart';
import '../../redux/all_State.dart';

class DatabasePosts extends StatefulWidget {
  @override
  _DatabasePostsState createState() => _DatabasePostsState();
}

class _DatabasePostsState extends State<DatabasePosts> {
  List<Post> _posts = [];
  bool _initial = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //_posts = StoreProvider.of<AllState>(context).state.posts;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          _posts = snapshot.data!.docs.map((doc) {
            return postFromDocument(doc.data() as Map<String, dynamic>);
          }).toList();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Loading();
        }

        //Setam stanje na početku
        if (_initial == false && _posts.isNotEmpty) {
          loading = true;

          StoreProvider.of<AllState>(context)
              .dispatch(GetFirebaseDataAction(_posts));
          loading = false;
          _initial = true;
        }

        return loading
            ? Loading()
            : Container(
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
