import 'dart:convert';
import 'package:capstone_flutter/models/topup_models.dart';
import 'package:http/http.dart' as http;

class TopUpApi {
  static const String baseUrl =
      'http://34.101.78.228:2424/api/v1/insurance/inquiry'; // Ganti dengan URL endpoint Anda

  // Fungsi untuk membuat Virtual Account
  static Future<TopUpR> createVirtualAccount(
    String customerId,
    String token,
  ) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({'bank_code': customerId,}),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print('ini json data : $jsonData');
      return TopUpR.fromJson(jsonData);
    } else {
      throw Exception('Failed to create Virtual Account');
    }
  }
}
