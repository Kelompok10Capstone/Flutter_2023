import 'package:flutter/material.dart';
import '../../view/screen/top_up_screen/top_up_screen.dart';

class TopUpViewModel extends ChangeNotifier {
  TopUPData? _response;

  TopUPData? get response => _response;

  void setResponse(TopUPData response) {
    _response = response;
    notifyListeners();
  }
}
