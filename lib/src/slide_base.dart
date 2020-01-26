import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter_keynote/src/providers/keynote_provider.dart';

class SlideBase extends StatefulWidget {

  final Widget child;
  final bool swipeGesture;

  SlideBase({Key key, @required this.child, this.swipeGesture}) : super(key: key);

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

    return Consumer<KeynoteProvider>(
      builder: (BuildContext context, KeynoteProvider keynoteProvider, _) {
        return RawKeyboardListener(
          focusNode: focusNode,
          onKey: (RawKeyEvent keyEvent) {
            if(keyEvent.runtimeType == RawKeyUpEvent) {
              if(keyEvent.logicalKey == LogicalKeyboardKey.arrowRight){
                keynoteProvider.nextPage(context);
              }
              if(keyEvent.logicalKey == LogicalKeyboardKey.arrowLeft){
                keynoteProvider.previousPage(context);
              }
            }
          },
          child: widget.swipeGesture ?
            addSwipeDetector(keynoteProvider) :
            widget.child
        );
      }
    );
  }

  Widget addSwipeDetector(KeynoteProvider keynoteProvider) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails endDetails) {
        if(endDetails.delta.dx > 10) {
          keynoteProvider.previousPage(context);
        }
        if(endDetails.delta.dx < -10) {
          keynoteProvider.nextPage(context);
        }
      },
      child: widget.child
    );
  }

}