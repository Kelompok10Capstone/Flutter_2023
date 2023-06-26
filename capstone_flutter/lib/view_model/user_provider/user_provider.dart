import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String name = '';
  String phone = '';
  double balance = 0.0;

  UserProvider() {
    //ntuk mengambil nilai dari SharedPreferences saat inisialisasi
    getSavedUserInfo();
  }

  Future<void> getSavedUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    phone = prefs.getString('phone') ?? '';
    balance = prefs.getDouble('balance') ?? 0.0;
    notifyListeners();
  }

  void updateUserInfo(
      String newName, String newPhone, double newBalance) async {
    name = newName;
    phone = newPhone;
    balance = newBalance;

    // Simpan nilai ke SharedPreferences setelah diperbarui
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('phone', phone);
    await prefs.setDouble('balance', balance);

    notifyListeners();
  }
}
