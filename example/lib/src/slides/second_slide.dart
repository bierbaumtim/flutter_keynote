import 'package:flutter/material.dart';

class SecondSlide extends StatelessWidget {
  const SecondSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
          color: Colors.deepOrange,
          child: Center(
            child: Text(
              'Slide 2',
              style: Theme.of(context).textTheme.display4,
            ),),
      ),
    );
  }
}