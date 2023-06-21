import 'package:http/http.dart' as http;
import 'dart:convert';

import '../wifi_model.dart';

class WifiInquiryApi {
  static const baseUrl = 'http://34.101.78.228:2424/api/v1/wifi/inquiry';

  static Future<WiFiInquiryResponse?> inquireWiFiBill(
    WiFiInquiryRequest request,
    String token,
  ) async {
    try {
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
      } else if (response.statusCode == 500) {
        throw Exception(
            'Failed to inquire WiFi bill. Status code: ${response.statusCode}. Invalid customer ID.');
      } else {
        throw Exception(
            'Failed to inquire WiFi bill. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Tangkap error dan tampung pesan error dalam variabel
      String errorMessage = 'Error occurred: $e';
      print(errorMessage);
      return null;
    }
  }
}
