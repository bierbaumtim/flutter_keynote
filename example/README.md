# Flutter Keynote Example App

A Flutter app to show the functionality for flutter_keynote package.

You can see this example running [here](https://ach4m0.github.io/flutter_keynote/).


## Usage

```yaml
dependencies:
  flutter_keynote:
```

Then you can use the KeynoteApp widget:

```dart
import 'package:flutter_keynote/flutter_keynote.dart';

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
      transition: KeynoteTransition.fade, // Default value
      theme: ThemeData(
        textTheme: TextTheme(
          display4: TextStyle(
            fontSize: 70.0,
            fontWeight: FontWeight.bold
          )
        )
      ),
      swipeGesture: true, // Default value
    );
  }

}

```
