import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:capstone_flutter/models/models_top_up.dart';

Future<TopUp?> getSinglePostData() async {
  TopUp? result;
  try {
    final response = await http.get(
      Uri.parse('http://34.101.78.228:2424/api/v1/amount'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = TopUp.fromJson(item);
      print (response.body);
    } else {
      print('error');
    }
  } catch (e) {
    print(e.toString());
  }
  return result;
}