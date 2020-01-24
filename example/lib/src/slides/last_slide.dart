import 'package:flutter/material.dart';

class LastSlide extends StatelessWidget {
  const LastSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          'Last slide 😋',
          style: Theme.of(context).textTheme.display4,
        ),
      ),
    );
  }
}