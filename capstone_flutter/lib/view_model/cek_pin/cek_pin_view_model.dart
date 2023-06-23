import 'package:capstone_flutter/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../models/apis/cek_pin_dio.dart';
import '../../models/apis/login.dart';

enum CekPinViewState {
  none,
  result,
  loading,
  error,
}

class CekPinViewModel with ChangeNotifier {
  CekPinViewState _state = CekPinViewState.none;
  CekPinViewState get state => _state;

  List<User> _cekPin = [];
  List<User> get cekPin => _cekPin;

  changeState(CekPinViewState s) {
    _state = s;
    notifyListeners();
  }

  Future<bool> postcekPin(String pin) async {
    changeState(CekPinViewState.loading);
    try {
      final token = await LoginController().getToken();
      final result = await CekPinApi(token).postCekPin(pin);
      debugPrint("Cek Pin Response: ${result.toString()}");

      final user = User.fromJson(result as Map<String, dynamic>);

      _cekPin = [user];

      if (_cekPin.isNotEmpty) {
        changeState(CekPinViewState.result);
        return true; // Operation succeeded
      } else {
        changeState(CekPinViewState.none);
        return false; // Operation failed
      }
    } catch (e) {
      changeState(CekPinViewState.error);
      return false; // Operation failed
    }
  }
}
