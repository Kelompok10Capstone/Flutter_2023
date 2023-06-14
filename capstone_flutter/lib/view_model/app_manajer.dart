import 'package:flutter/material.dart';

class AppManajer extends ChangeNotifier {
  bool _ispinAdded = false;
  bool get ispinAdded => _ispinAdded;

  void changePin(bool pin) {
    _ispinAdded = pin;
    notifyListeners();
  }
}
