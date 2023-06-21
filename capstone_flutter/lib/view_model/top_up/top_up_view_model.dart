import 'package:flutter/material.dart';
import '../../models/top_up_model.dart';

class TopUpViewModel extends ChangeNotifier {
  TopUpResponse? _response;

  TopUpResponse? get response => _response;

  void setResponse(TopUpResponse response) {
    _response = response;
    notifyListeners();
  }
}
