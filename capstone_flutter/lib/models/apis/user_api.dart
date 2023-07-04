import 'dart:convert';

import '../user_model.dart';
import 'package:http/http.dart' as http;

class UserApiController {
  Future<User?> getUserProfile(String token) async {
    try {
      final profileUrl = Uri.parse('http://34.101.114.216:2424/api/v1/profile');
      final profileHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Menggunakan token JWT pada header
      };
      final profileResponse =
          await http.get(profileUrl, headers: profileHeaders);

      if (profileResponse.statusCode == 200) {
        final profileJsonData = jsonDecode(profileResponse.body);

        return User.fromJson(profileJsonData);
      }
      return null;
    } catch (e, s) {
      throw 'getUserProfile Error: $s;\nStackrace: $s';
    }
  }
}
