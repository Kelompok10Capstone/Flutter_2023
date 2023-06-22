import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String name = '';
  String phone = '';
  int balance = 0;

  UserProvider() {
    //ntuk mengambil nilai dari SharedPreferences saat inisialisasi
    getSavedUserInfo();
  }

  Future<void> getSavedUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    phone = prefs.getString('phone') ?? '';
    balance = prefs.getInt('balance') ?? 0;
    notifyListeners();
  }

  void updateUserInfo(String newName, String newPhone, int newBalance) async {
    name = newName;
    phone = newPhone;
    balance = newBalance;

    // Simpan nilai ke SharedPreferences setelah diperbarui
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('phone', phone);
    await prefs.setInt('balance', balance);

    notifyListeners();
  }
}
