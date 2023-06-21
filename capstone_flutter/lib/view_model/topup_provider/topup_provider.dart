import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopUpR {
  final String vaNumber;
  final String usernameDisplay;

  TopUpR({required this.vaNumber, required this.usernameDisplay});

  factory TopUpR.fromJson(Map<String, dynamic> json) {
    return TopUpR(
      vaNumber: json['vaNumber'],
      usernameDisplay: json['usernameDisplay'],
    );
  }
}

class TopUpProvider extends ChangeNotifier {
  static const String baseUrl = 'http://34.101.78.228:2424/api/v1/amount'; // Ganti dengan URL endpoint Anda

  String? vaNumber;
  String? usernameDisplay;
  bool isLoading = false;

  Future<void> createVirtualAccount(String userId, String token) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({'user_id': userId}),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print('ini json data : $jsonData');
        final topUpR = TopUpR.fromJson(jsonData['data']);
        vaNumber = topUpR.vaNumber;
        usernameDisplay = topUpR.usernameDisplay;
      } else {
        throw Exception('Failed to create Virtual Account');
      }
    } catch (error) {
      print(error);
      // Handle error as per your requirement
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}