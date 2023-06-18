import 'package:flutter/material.dart';

class AppManajer extends ChangeNotifier {
  bool _ispinAdded = false;
  bool get ispinAdded => _ispinAdded;

  void changePin(bool pin) {
    print('changePin0 _ispinAdded: $_ispinAdded');
    print('changePin0 pin: $pin');
    _ispinAdded = pin;

    print('changePin1 _ispinAdded: $_ispinAdded');
    print('changePin1 pin: $pin');
    notifyListeners();
  }

  void changePinTrue() {
    _ispinAdded = true;
    notifyListeners();
  }
}
