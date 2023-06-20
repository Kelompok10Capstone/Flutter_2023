import 'dart:convert';
import 'package:http/http.dart' as http;

import '../history_model.dart';

class TransactionApi {
  static Future<List<Transaction>> fetchTransactions(String token) async {
    const String baseUrl =
        'http://34.101.78.228:2424/api/v1/user/transactions/';

    final Uri uri = Uri.parse(baseUrl);
    final Map<String, String> queryParams = {
      'page': '1',
      'limit': '10',
    };

    final Uri fullUri = uri.replace(queryParameters: queryParams);

    final response = await http.get(
      fullUri,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> transactionsData = jsonData['data'];

      return transactionsData
          .map((transaction) => Transaction.fromJson(transaction))
          .toList();
    } else {
      print(fullUri);
      print(token);
      throw Exception('Failed to fetch transactions');
    }
  }
}
