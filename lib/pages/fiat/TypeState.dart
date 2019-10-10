import 'package:flutter/cupertino.dart';

class TypeState with ChangeNotifier {
  int _type;
  int get type => _type ?? 1;

  void setType(int val) {
    if (_type == val) return;

    _type = val;
    notifyListeners();
  }
}