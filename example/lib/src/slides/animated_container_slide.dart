import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerSlide extends StatefulWidget {
  AnimatedContainerSlide({Key key}) : super(key: key);

  @override
  _AnimatedContainerSlideState createState() => _AnimatedContainerSlideState();
}

class _AnimatedContainerSlideState extends State<AnimatedContainerSlide> {
  double _width = 200.0;
  double _height = 200.0;
  double _borderRadius = 20.0;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated container'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            height: _height,
            width: _width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
                color: _color),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () {
          setState(() {
            _width = Random().nextInt(300).toDouble();
            _height = Random().nextInt(300).toDouble();
            _borderRadius = Random().nextInt(30).toDouble();
            _color = Color.fromRGBO(Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255), 1.0);
          });
        },
      ),
    );
  }
}
