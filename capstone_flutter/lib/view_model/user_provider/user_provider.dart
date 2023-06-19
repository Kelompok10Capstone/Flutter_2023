import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String name = '';
  String phone = '';
  int balance = 0;

  void updateUserInfo(String newName, String newPhone, int newBalance) {
    name = newName;
    phone = newPhone;
    balance = newBalance;
    notifyListeners();
  }
}
