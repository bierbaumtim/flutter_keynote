import 'package:flutter/material.dart';

class SlideProvider with ChangeNotifier {

  final int maxLength;

  int _slideActive = 0;

  SlideProvider({@required this.maxLength});

  int getPageIndex() => _slideActive;

  void nextPage(context) {
    _slideActive++;
    notifyListeners();
    Navigator.pushNamed(context, _slideActive.toString());
  }

  void previousPage(context) {
    if(_slideActive != 0){
      Navigator.pop(context);
      _slideActive--;
    }
    notifyListeners();
  }

}