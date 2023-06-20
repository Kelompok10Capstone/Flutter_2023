import 'package:flutter/material.dart';

import '../../models/apis/login.dart';
import '../../models/apis/top_up/top_up_api.dart';
import '../../models/apis/top_up/top_up_api_dio.dart';
import '../../models/top_up_model.dart';

enum TopUpdataViewState {
  none,
  result,
  loading,
  error,
}

class TopUPDataViewModel with ChangeNotifier {
  TopUpdataViewState _state = TopUpdataViewState.none;
  TopUpdataViewState get state => _state;

  List<TopUpdataData> _users = [];
  List<TopUpdataData> get users => _users;

  changeState(TopUpdataViewState s) {
    _state = s;
    notifyListeners();
  }

  postTopUp(String codeBank) async {
    changeState(TopUpdataViewState.loading);
    try {
      final token = await LoginController().getToken();
      final result = await TopUpDioDataApi(token).postTopUpApi(codeBank);
      debugPrint("Top Up Response: ${result.toString()}");
      // _users = result as List<TopUpdataData>;
      _users = result.data ?? [];

      if (_users.isEmpty) {
        changeState(TopUpdataViewState.none);
      } else {
        changeState(TopUpdataViewState.result);
      }
    } catch (e) {
      changeState(TopUpdataViewState.error);
    }
  }
}
