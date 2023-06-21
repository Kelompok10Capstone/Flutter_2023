// import 'package:flutter/material.dart';

// import '../../models/apis/login.dart';
// import '../../models/apis/top_up/top_up_api.dart';
// import '../../models/apis/top_up/top_up_api_dio.dart';
// import '../../models/top_up_model.dart';

// enum TopUpdataViewState {
//   none,
//   result,
//   loading,
//   error,
// }

// class TopUPDataViewModel with ChangeNotifier {
//   TopUpdataViewState _state = TopUpdataViewState.none;
//   TopUpdataViewState get state => _state;

//   List<TopUpResponse> _topupusers = [];
//   List<TopUpResponse> get topupusers => _topupusers;

//   changeState(TopUpdataViewState s) {
//     _state = s;
//     notifyListeners();
//   }

//   postTopUpApi(String codeBank) async {
//     changeState(TopUpdataViewState.loading);
//     try {
//       final token = await LoginController().getToken();
//       final result = await TopUpApi(token).postTopUpApi(codeBank);
//       debugPrint("Top Up Response: ${result.toString()}");
//       _topupusers = result as List<TopUpResponse>;

//       if (_topupusers.isEmpty) {
//         changeState(TopUpdataViewState.none);
//       } else {
//         changeState(TopUpdataViewState.result);
//       }
//     } catch (e) {
//       changeState(TopUpdataViewState.error);
//     }
//   }
// }
