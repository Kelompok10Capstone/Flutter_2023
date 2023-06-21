
import 'package:capstone_flutter/models/apis/top_up.dart';
import 'package:flutter/material.dart';

import '../../models/apis/login.dart';
import '../../models/topup_models.dart';

//
class TopUpProvider extends ChangeNotifier {
  static const String baseUrl =
      'http://34.101.78.228:2424/api/v1/amount'; // Ganti dengan URL endpoint Anda

  String? vaNumber;
  String? usernameDisplay;
  bool isLoading = false;

  TopUpR? _topUp;
  TopUpR? get topUp => _topUp;

  Future<void> createVirtualAccount(String? bankCode) async {
    try {
      isLoading = true;
      notifyListeners();
      final token = await LoginController().getToken();

      final result =
          await TopUpApi.createVirtualAccount(bankCode ?? "002", token);
      _topUp = result;
      notifyListeners();

      // final response = await http.post(
      //   Uri.parse(baseUrl),
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Authorization': 'Bearer $token',
      //   },
      //   body: json.encode({'user_id': userId}),
      // );

      // if (response.statusCode == 200) {
      //   final jsonData = json.decode(response.body);
      //   print('ini json data : $jsonData');
      //   final topUpR = TopUpR.fromJson(jsonData['data']);
      //   vaNumber = topUpR.vaNumber;
      //   usernameDisplay = topUpR.usernameDisplay;
      // } else {
      //   throw Exception('Failed to create Virtual Account');
      // }
    } catch (error) {
      print(error);
      // Handle error as per your requirement
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
