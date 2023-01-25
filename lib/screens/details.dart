import 'package:flutter/material.dart';

import '../shared/constants.dart';

class PostDetails extends StatelessWidget {
  final  inputName;
  final  inputContent;
  final  inputUrl;
  PostDetails (this.inputName, this.inputContent, this.inputUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post: "+ inputName)),
      body:
          Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            decoration: backgroundGradient,
            child: Center(
              child:
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top:20),
                child:Image.network(inputUrl,
                  width: 200,), ),
                Padding(padding: EdgeInsets.all(20),
                  child:Text(inputName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.white
                    ) ,
                  ), ),
                Padding(padding: EdgeInsets.all(10),
                child:
                Text(inputContent,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black
                  ) ,),),

              ],
            ),),
          )

    );
  }

}