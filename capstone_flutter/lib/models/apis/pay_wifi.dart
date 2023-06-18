import 'package:http/http.dart' as http;
import 'dart:convert';

import '../wifi_model.dart';

class PayWifi {
  static const baseUrl = 'http://34.101.78.228:2424/api/v1/wifi/pay';

  final String id;
  final String token;

  PayWifi(this.id, this.token);

  Future<String> payWifi() async {
    final Map<String, dynamic> requestBody = {
      'partner_tx_id': id,
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
      print('Berhasil: ${response.statusCode}');
      print('Response: ${response.body}');

      if (metadata['status'] == 202) {
        final wifiId = jsonData['id'];
        print('Berhasil: ${response.statusCode}');
        print('Response: ${response.body}');

        return wifiId;
      } else {
        throw Exception('Payment failed: ${metadata['message']}');
      }
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
