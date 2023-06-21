import 'dart:convert';
import 'package:capstone_flutter/models/topup_models.dart';
import 'package:http/http.dart' as http;

class TopUpApi {
  static const String baseUrl = 'http://34.101.78.228:2424/api/v1/amount'; // Ganti dengan URL endpoint Anda

  // Fungsi untuk membuat Virtual Account
  static Future<TopUpR> createVirtualAccount(
    String userId,
    String token,
    ) async {
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
      return TopUpR.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to create Virtual Account');
    }
  }
}
