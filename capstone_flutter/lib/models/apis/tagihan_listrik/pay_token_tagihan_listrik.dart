import 'package:http/http.dart' as http;
import 'dart:convert';

class PayTokenTagihanListrik {
  static const baseUrl =
      'http://34.101.114.216:2424/api/v1/electricity/postpaid/pay';

  final String id;
  final String token;

  PayTokenTagihanListrik(this.id, this.token);

  Future<String?> payTokenTagihanListrik() async {
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
      // ignore: avoid_print
      print('Berhasil: ${response.statusCode}');
      // ignore: avoid_print
      print('Response: ${response.body}');

      if (metadata['status'] == 202) {
        final wifiId = jsonData['id'];
        // ignore: avoid_print
        print('Berhasil: ${response.statusCode}');
        // ignore: avoid_print
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
