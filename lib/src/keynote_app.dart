import 'package:flutter/material.dart';
import 'package:flutter_keynote/src/keynote_transition.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_keynote/src/providers/keynote_provider.dart';
import 'package:flutter_keynote/src/slide_base.dart';

class KeynoteApp extends StatelessWidget {

  final String title;
  final List<Widget> slides;
  final KeynoteTransition transition;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  final bool swipeGesture;

  const KeynoteApp({
    Key key,
    @required this.slides,
    this.transition = KeynoteTransition.fade,
    this.title = 'Flutter Keynote',
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.swipeGesture = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => KeynoteProvider(maxLength: slides.length)),
      ],
      child: Consumer<KeynoteProvider>(
        builder: (BuildContext context, KeynoteProvider keynoteProvider, _) {
          return MaterialApp(
            title: this.title,
            debugShowCheckedModeBanner: false,
            theme: this.theme,
            darkTheme: this.darkTheme,
            themeMode: this.themeMode,
            initialRoute: keynoteProvider.getPageIndex().toString(),
            onGenerateRoute: (RouteSettings settings) {
              return PageTransition(
                type: getTransitionType(transition),
                child: SlideBase(
                  child: slides[int.parse(settings.name)],
                  swipeGesture: swipeGesture,
                )
              );
            },
          );
        }
      ),
    );

  }
}