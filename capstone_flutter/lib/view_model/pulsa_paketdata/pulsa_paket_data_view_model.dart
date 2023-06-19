import 'package:capstone_flutter/models/apis/login.dart';
import 'package:capstone_flutter/models/apis/pulsa_paket_data/pulsa_paket_data_api.dart';
import 'package:capstone_flutter/models/pulsa_paket_data.dart';
import 'package:flutter/material.dart';

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

  getPhone(String phone) async {
    changeState(PulsaPaketdataViewState.loading);
    try {
      final token = await LoginController().getToken();
      final result = await PulsaPaketDataApi(token).getPulsaPaketData(phone);
      debugPrint("Pulsa Paket Data Response: ${result.toJson().toString()}");
      _users = result.data ?? [];
      // const token = 'token';
      // final c = await PulsaPaketDataApi(token).getPulsaPaketData('');
      // _users = c as List<PulsaPaketdataData>;
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
