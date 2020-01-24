# Flutter Keynote Package

A Flutter package to create presentations with app pages.
<br/>
[![flutter platform](https://img.shields.io/badge/Platform-Flutter-yellow.svg)](https://flutter.io)
[![BSD-2-Clause](https://img.shields.io/badge/BSD-2-Clause.svg?style=flat-square)](https://opensource.org/licenses/)

## Usage

It is really easy to use!
You should ensure that you add the `flutter_keynote` as a dependency in your flutter project.

```yaml
dependencies:
  page_transition: "^1.1.5"
```

Then you can use the KeynoteApp widget:

```dart
import 'package:flutter_keynote/flutter_keynote.dart';

final List<Widget> slides = [
  FirstSlide(),
  SecondSlide(),
];

class KeynoteExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KeynoteApp(
      slides: slides
    );
  }
}

```

## License

[BSD 2-Clause](https://opensource.org/licenses/BSD-2-Clause)
