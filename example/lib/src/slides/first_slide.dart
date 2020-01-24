import 'package:flutter/material.dart';

class FirstSlide extends StatelessWidget {
  const FirstSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          'Slide 1',
          style: Theme.of(context).textTheme.display4,
        ),
      ),
    );
  }
}