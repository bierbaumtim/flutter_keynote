import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_keynote/src/providers/slide_provider.dart';
import 'package:flutter_keynote/src/slide_base.dart';

class KeynoteApp extends StatelessWidget {

  final List<Widget> slides;
  final String title;

  const KeynoteApp({Key key, @required this.slides, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SlideProvider(maxLength: slides.length)),
      ],
      child: Consumer<SlideProvider>(
        builder: (BuildContext context, SlideProvider slideProvider, _) {
          return MaterialApp(
            title: this.title ?? '',
            debugShowCheckedModeBanner: false,
            initialRoute: slideProvider.getPageIndex().toString(),
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (_) => SlideBase(child: slides[int.parse(settings.name)])
              );
            },
          );
        }
      ),
    );

  }
}