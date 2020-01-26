import 'package:flutter/material.dart';

class KeynoteProvider with ChangeNotifier {

  final int maxLength;

  int _slideActive = 0;

  KeynoteProvider({@required this.maxLength});

  int getPageIndex() => _slideActive;

  void nextPage(context) {
    if(_slideActive == maxLength - 1) return;

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