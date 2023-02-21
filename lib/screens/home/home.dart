import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../redux/Login_redux/login_state.dart';
import '../../redux/Login_redux/login_thunk.dart';
import '../../shared/constants.dart';
import '../new_post.dart';
import 'package:blog_posts/screens/home/database_posts.dart';
import '../wrapper.dart';

class Home extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  //final _log=LoginService();
  //varijanta sa provajderom
  List<dynamic> postsData = [];

  ValueNotifier<String> inputName = ValueNotifier<String>("");
  ValueNotifier<String> inputContent = ValueNotifier<String>("");
  ValueNotifier<String> inputUrl = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog post App"),
        actions: <Widget>[
          FloatingActionButton.extended(
            heroTag: UniqueKey(),
            onPressed: () {
              StoreProvider.of<LoginState>(context).dispatch(thunkLogout());
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wrapper()));
              //varijanta sa provajderom
              // await _log.signOut();
            },
            icon: Icon(Icons.logout),
            label: Text("Logout"),
            backgroundColor: Colors.blue[600],
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: backgroundGradient,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: DatabasePosts(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                "Add new post",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewScreen()));
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
