import 'package:flutter/material.dart';

import '../../view/screen/pulsa&paket_data_screen/pulsa&paketData_screen.dart';

class PaketDataProvider with ChangeNotifier {
  PaketData? _paketData;
  PaketData? get paketData => _paketData;

  PaketData? _pulsa;
  PaketData? get pulsa => _pulsa;

  void setPaketData(PaketData paketData) {
    _paketData = paketData;
    notifyListeners();
  }

  void setPulsa(PaketData pulsa) {
    _pulsa = pulsa;
    notifyListeners();
  }
}
