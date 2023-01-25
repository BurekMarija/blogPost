import 'package:blog_posts/models/post.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService{

  final CollectionReference postsCollection=FirebaseFirestore.instance.collection("posts");
  final String uid;
  DatabaseService ({required this.uid});

  //Stream za promjene
  Stream<List<Post>> get posts{
    return postsCollection.snapshots().map((snap)=>_postsFromDatabase(snap));
  }

 //Lista postova iz baze
  List<Post> _postsFromDatabase(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return Post(
        //Baš me gnjaviš
          name: doc.data().toString().contains("name")? doc.get("name"): "",
          id: doc.data().toString().contains("id")? doc.get("id"): "",
          content: doc.data().toString().contains("content")? doc.get("content"): "",
          url: doc.data().toString().contains("url")? doc.get("url"): ""
      );
      }).toList();
  }

  //Spremanje podataka
  Future createPost(String name, String content, String url) async{
    final docPosts=FirebaseFirestore.instance.collection("posts").doc();

    final json= {
      "id": docPosts.id,
      "name": name,
      "content": content,
      "src": url,
    };
    //Stvori taj post u firebase
    await docPosts.set(json);
  }
}
