import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter_keynote/src/providers/keynote_provider.dart';

class SlideBase extends StatefulWidget {

  final Widget child;

  SlideBase({Key key, @required this.child}) : super(key: key);

  @override
  _SlideBaseState createState() => _SlideBaseState();
}

class _SlideBaseState extends State<SlideBase> {
  
  final FocusNode focusNode = FocusNode();
  DragStartDetails _startDetails;
  DragUpdateDetails _updateDetails;

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
          child: addSwipeDetector(keynoteProvider)
        );
      }
    );
  }

  Widget addSwipeDetector(KeynoteProvider keynoteProvider) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails startDetails) {
        _startDetails = startDetails;
      },
      onHorizontalDragUpdate: (DragUpdateDetails updateDetails) {
        _updateDetails = updateDetails;
      },
      onHorizontalDragEnd: (DragEndDetails endDetails) {
        double dy = _updateDetails.globalPosition.dy - _startDetails.globalPosition.dy;
        if(dy > 10) {
          keynoteProvider.previousPage(context);
        }
        if(dy < -10) {
          keynoteProvider.nextPage(context);
        }
      },
      child: widget.child
    );
  }

}