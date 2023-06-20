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

  List<PulsaPaketdataData> _pulsa = [];
  List<PulsaPaketdataData> get pulsa => _pulsa;

  List<PulsaPaketdataData> _paketData = [];
  List<PulsaPaketdataData> get paketData => _paketData;

  changeState(PulsaPaketdataViewState s) {
    _state = s;
    notifyListeners();
  }

  getPhone(String phone) async {
    changeState(PulsaPaketdataViewState.loading);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final token = await LoginController().getToken();
        final result = await PulsaPaketDataApi(token).getPulsaPaketData(phone);
        debugPrint("Pulsa Paket Data Response: ${result.toJson().toString()}");

        _pulsa = [];
        _paketData = [];
        for (PulsaPaketdataData element in result.data ?? []) {
          if (element.type == "pulsa") {
            _pulsa.add(element);
          } else {
            _paketData.add(element);
          }
        }

        if (_pulsa.isNotEmpty || _paketData.isNotEmpty) {
          changeState(PulsaPaketdataViewState.result);
        } else {
          changeState(PulsaPaketdataViewState.none);
        }
      } catch (e) {
        changeState(PulsaPaketdataViewState.error);
      }
    });
  }
}
