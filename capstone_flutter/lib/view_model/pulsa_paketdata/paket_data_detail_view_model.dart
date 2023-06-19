import 'package:flutter/material.dart';

import '../../view/screen/pulsa&paket_data_screen/pulsa&paketData_screen.dart';

class PaketDataProvider with ChangeNotifier {
  PaketData? _paketData;

  PaketData? get paketData => _paketData;

  void setPaketData(PaketData paketData) {
    _paketData = paketData;
    notifyListeners();
  }
}
