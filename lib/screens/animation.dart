import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationState();
}

class _AnimationState extends State<AnimationScreen> {
  double position = 0;
  bool isFlipped = false;
  bool isStart = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        if (isStart) {
          if (isFlipped == false) {
            position += 40;
          } else {
            position -= 40;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
              top: -100,
              left: -100 + position,
              height: 800,
              child: Image.asset("images/cvt_background_v5.png"),
              duration: Duration(microseconds: 200)),
          Positioned(
              top: 300,
              left: 150,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: isFlipped ? AssetImage("images/astronaut.png") : AssetImage("images/astronaut_flip.png"),
                )),
              )),
          Positioned(
              top: 700,
              left: MediaQuery.of(context).size.width / 2 - 80,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  setState(() {
                    isFlipped = false;
                    //position -= 40;
                  });
                },
              )),
          Positioned(
              top: 700,
              left: MediaQuery.of(context).size.width / 2,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  setState(() {
                    isFlipped = true;
                    //position += 40;
                  });
                },
              )),
          Positioned(
              top: 700,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: IconButton(
                icon: isStart ? Icon(Icons.pause_circle_filled) : Icon(Icons.not_started),
                onPressed: () {
                  setState(() {
                    isStart = !isStart;
                    //position += 40;
                  });
                },
              )),
        ],
      ),
    );
  }
}
