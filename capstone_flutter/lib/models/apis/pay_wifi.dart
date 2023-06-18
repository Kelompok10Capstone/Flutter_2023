import 'package:http/http.dart' as http;
import 'dart:convert';

import '../wifi_model.dart';

class PayWifi {
  static const baseUrl = 'http://34.101.78.228:2424/api/v1/wifi/pay';

  static Future<String> payWifi(
    String partnerTxId,
    String token,
  ) async {
    final Map<String, dynamic> requestBody = {
      'partner_tx_id': partnerTxId,
    };

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 202) {
      final jsonData = jsonDecode(response.body);
      final metadata = jsonData['metadata'];

      if (metadata['status'] == 202) {
        final wifiInquiryResponse =
            WiFiInquiryResponse.fromJson(jsonData['data']);
        final id = wifiInquiryResponse.id;
        return id;
      } else {
        throw Exception('Payment failed: ${metadata['message']}');
      }
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
