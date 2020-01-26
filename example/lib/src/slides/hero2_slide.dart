import 'package:flutter/material.dart';

class Hero2Slide extends StatelessWidget {
  const Hero2Slide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'textHero',
            child: Text(
              'Testing hero between slides',
              style: Theme.of(context).textTheme.display2,
            ),
          ),
          Hero(
            tag: 'avatarHero',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image(
                image: AssetImage(
                  'assets/images/avatar.png',
                ),
                height: 100,
                width: 100
              ),
            )
          )
        ],
        
      ),
    );
  }
}