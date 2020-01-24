import 'package:flutter/material.dart';

class Hero1Slide extends StatelessWidget {
  const Hero1Slide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
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
          Spacer(),
          Hero(
            tag: 'avatarHero',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image(
                image: AssetImage(
                  'assets/images/avatar.png',
                ),
                height: 200,
                width: 200
              ),
            )
          )
        ],
        
      ),
    );
  }
}