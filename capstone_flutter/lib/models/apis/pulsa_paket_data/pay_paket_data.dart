import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PayPaketData {
  static const baseUrl = 'http://34.101.78.228:2424/api/v1/user/ppd';

  final String paketdata;
  final String productid;
  final String? discountid;
  final String phonenumber;
  final String token;

  PayPaketData(
    this.token,
    this.paketdata,
    this.productid,
    this.phonenumber,
    this.discountid,
  );

  Future<String?> payPaketData() async {
    final Map<String, dynamic> requestBody = {
      "type": paketdata,
      "product_id": productid,
      "discount_id": discountid,
      "phone_number": phonenumber,
    };

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final metadata = jsonData['metadata'];
      debugPrint('Berhasil: ${response.statusCode}');
      debugPrint('Response: ${response.body}');

      if (metadata['status'] == 201) {
        final ppdId = jsonData['id'];
        debugPrint('Berhasil: ${response.statusCode}');
        debugPrint('Response: ${response.body}');

        return ppdId;
      } else {
        debugPrint('Payment failed: ${metadata['message']}');
        return null;
      }
    } else {
      debugPrint('error: ${response.statusCode}');
      return null;
    }
  }
}
