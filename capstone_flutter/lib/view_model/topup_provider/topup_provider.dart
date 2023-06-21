import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopUpProvider extends ChangeNotifier {
  String? vaNumber;
  String? usernameDisplay;

  void updateData({String? vaNumber, String? usernameDisplay}) {
    this.vaNumber = vaNumber;
    this.usernameDisplay = usernameDisplay;
    notifyListeners();
  }
}

class TopUp {
  final String? bankCode;

  TopUp({
    required this.bankCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'bank_code': bankCode,
    };
  }
}

class TopUpR {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String userId;
  String vaNumber;
  String vaStatus;
  String bankCode;
  double amount;
  int expirationTime;
  String usernameDisplay;

  TopUpR({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.vaNumber,
    required this.vaStatus,
    required this.bankCode,
    required this.amount,
    required this.expirationTime,
    required this.usernameDisplay,
  });

  factory TopUpR.fromJson(Map<String, dynamic> json) {
    return TopUpR(
      id: json['data']['id'],
      createdAt: DateTime.parse(json['data']['CreatedAt']),
      updatedAt: DateTime.parse(json['data']['UpdatedAt']),
      deletedAt: json['data']['DeletedAt'],
      userId: json['data']['user_id'],
      vaNumber: json['data']['va_number'],
      vaStatus: json['data']['va_status'],
      bankCode: json['data']['bank_code'],
      amount: json['data']['amount'].toDouble(),
      expirationTime: json['data']['expiration_time'],
      usernameDisplay: json['data']['username_display'],
    );
  }
}

class TopUpApi {
  static const String baseUrl = 'http://34.101.78.228:2424/api/v1/amount'; // Ganti dengan URL endpoint Anda

  // Fungsi untuk membuat Virtual Account
  static Future<TopUpR> createVirtualAccount(String userId, String token, TopUpProvider topUpModel) async {
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
      final topUpR = TopUpR.fromJson(jsonData['data']);

      // Update data pada change notifier
      topUpModel.updateData(vaNumber: topUpR.vaNumber, usernameDisplay: topUpR.usernameDisplay);

      return topUpR;
    } else {
      throw Exception('Failed to create Virtual Account');
    }
  }
}