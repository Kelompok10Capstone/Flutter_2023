import 'package:flutter/foundation.dart';

import '../../models/wifi_model.dart';

class WiFiInquiryProvider extends ChangeNotifier {
  WiFiInquiryResponse? _response;

  WiFiInquiryResponse? get response => _response;

  void setResponse(WiFiInquiryResponse response) {
    _response = response;
    notifyListeners();
  }
}
