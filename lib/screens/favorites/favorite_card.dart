import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../models/post.dart';
import '../details.dart';

class FavoriteCard extends StatelessWidget {
  final Post post;

  const FavoriteCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Colors.transparent,
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          post.name.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22.0, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          //width: MediaQuery.of(context).size.width * 0.3,
                          child: Image.network(
                            post.url.toString(),
                            width: 100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            post.content.toString(),
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: FloatingActionButton.small(
                          heroTag: UniqueKey(),
                          onPressed: () {
                            Get.to(() =>
                                PostDetails(post.name, post.content, post.url));
                          },
                          child: const Icon(Icons.info),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
