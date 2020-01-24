import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter_keynote/src/providers/slide_provider.dart';

class SlideBase extends StatefulWidget {

  final Widget child;

  SlideBase({Key key, @required this.child}) : super(key: key);

  @override
  _SlideBaseState createState() => _SlideBaseState();
}

class _SlideBaseState extends State<SlideBase> {
  
  final FocusNode focusNode = FocusNode();

  @override
  void initState() { 
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);

    return Consumer<SlideProvider>(
      builder: (BuildContext context, SlideProvider slideProvider, _) {
        return RawKeyboardListener(
          focusNode: focusNode,
          onKey: (RawKeyEvent keyEvent) {
            if(keyEvent.runtimeType == RawKeyUpEvent) {
              if(keyEvent.logicalKey == LogicalKeyboardKey.arrowRight){
                slideProvider.nextPage(context);
              }
              if(keyEvent.logicalKey == LogicalKeyboardKey.arrowLeft){
                slideProvider.previousPage(context);
              }
            }
          },
          child: widget.child
        );
      }
    );
  }

}