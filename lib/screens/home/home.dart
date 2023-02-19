import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/post.dart';
import '../../redux/Login_redux/login_actions.dart';
import '../../redux/Login_redux/login_state.dart';
import '../../redux/Login_redux/reducer.dart';
import '../../shared/constants.dart';
import '../new_post.dart';
import "package:blog_posts/services/database.dart";
import "package:provider/provider.dart";
import 'package:blog_posts/screens/home/database_posts.dart';
import '../../services/log.dart';
import 'package:redux/redux.dart';

import '../wrapper.dart';

class Home extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  //final _log=LoginService();
  //varijanta sa provajderom
  List<dynamic> postsData=[];

  ValueNotifier<String> inputName=ValueNotifier<String>("");
  ValueNotifier<String> inputContent=ValueNotifier<String>("");
  ValueNotifier<String> inputUrl=ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    final loginStore = Store<LoginState>(
      loginReducer,
      initialState: LoginState(uid: ''),
    );
    return
        Scaffold(
        appBar: AppBar(
          title: Text("Blog post App"),
              actions: <Widget>[
                FloatingActionButton.extended(
                  heroTag: UniqueKey(),
                  onPressed: ()async {
                    loginStore.dispatch(Logout);
                    Get.to(()=>Wrapper());
                    //varijanta sa provajderom
                 // await _log.signOut();
                },
                  icon: Icon(Icons.logout),
                  label: Text("Logout"),
                  backgroundColor: Colors.blue[600],
                ),
              ],
        ),
        body:
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: backgroundGradient,
              child: SingleChildScrollView(child:
              Column(
                children: [
                  SizedBox(height: 20,),
                  SingleChildScrollView(child: DatabasePosts(),),
                  SizedBox(height: 10,),

                  Padding(padding: EdgeInsets.only(top: 20),),
                  Text("Add new post",
                    style: TextStyle(fontSize: 20, color: Colors.white),),
                  TextButton(
                    onPressed: () {
                      Get.to(NewScreen());
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),),
            ),


    );


  }

}
