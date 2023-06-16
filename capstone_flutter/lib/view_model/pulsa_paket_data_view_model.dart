import 'package:capstone_flutter/models/apis/pulsa_paket_data_api.dart';
import 'package:capstone_flutter/models/pulsa_paket_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PulsaPaketdataViewState {
  none,
  result,
  loading,
  error,
}

class PulsaDanPaketDataViewModel with ChangeNotifier {
  PulsaPaketdataViewState _state = PulsaPaketdataViewState.none;
  PulsaPaketdataViewState get state => _state;

  List<PulsaPaketdataData> _users = [];
  List<PulsaPaketdataData> get users => _users;

  changeState(PulsaPaketdataViewState s) {
    _state = s;
    notifyListeners();
  }

  getPhone() async {
    changeState(PulsaPaketdataViewState.loading);
    try {
      const token = 'token';
      final c = await PulsaPaketDataApi(token).getPulsaPaketData('');
      _users = c as List<PulsaPaketdataData>;
      if (_users.isEmpty) {
        changeState(PulsaPaketdataViewState.none);
      } else {
        changeState(PulsaPaketdataViewState.result);
      }
      notifyListeners();
    } catch (e) {
      changeState(PulsaPaketdataViewState.error);
    }
  }
}
