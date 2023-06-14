import 'package:capstone_flutter/models/apis/pulsa_paket_data_api.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

enum PulsaPaketdataViewState {
  none,
  loading,
  error,
}

class PulsaPaketDataViewModel with ChangeNotifier {
  PulsaPaketdataViewState _state = PulsaPaketdataViewState.none;
  PulsaPaketdataViewState get state => _state;

  List<User> _users = [];
  List<User> get users => _users;

  changeState(PulsaPaketdataViewState s) {
    _state = s;
    notifyListeners();
  }

  getPhone() async {
    changeState(PulsaPaketdataViewState.loading);
    try {
      final token = '';
      final c = await PulsaPaketDataApi(token).getPulsaPaketData('');
      _users = c as List<User>;
      notifyListeners();
      changeState(PulsaPaketdataViewState.none);
    } catch (e) {
      changeState(PulsaPaketdataViewState.error);
    }
  }
}
