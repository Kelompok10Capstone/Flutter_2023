import '../wifi_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WifiInquiryApi {
  static const baseUrl = 'http://34.101.78.228:2424/api/v1/wifi/inquiry';

  static Future<WiFiInquiryResponse> inquireWiFiBill(
    WiFiInquiryRequest request,
    String token,
  ) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      final metadata = jsonData['metadata'];
      print(data);

      return WiFiInquiryResponse.fromJson(data);
    } else {
      throw Exception(
          'Failed to inquire WiFi bill. Status code: ${response.statusCode}');
    }
  }
}
