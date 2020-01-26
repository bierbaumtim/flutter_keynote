import 'package:flutter/material.dart';
import 'package:flutter_keynote/flutter_keynote.dart';

import 'package:example/src/slides/animated_container_slide.dart';
import 'package:example/src/slides/first_slide.dart';
import 'package:example/src/slides/flare_slide.dart';
import 'package:example/src/slides/hero1_slide.dart';
import 'package:example/src/slides/hero2_slide.dart';
import 'package:example/src/slides/last_slide.dart';
import 'package:example/src/slides/second_slide.dart';

final List<Widget> slides = [
  FirstSlide(),
  SecondSlide(),
  Hero1Slide(),
  Hero2Slide(),
  AnimatedContainerSlide(),
  FlareSlide(),
  LastSlide(),
];

class KeynoteExampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return KeynoteApp(
      title: 'Flutter Keynote Example',
      slides: slides,
      transition: KeynoteTransition.rightToLeft,
    );
  }

}
