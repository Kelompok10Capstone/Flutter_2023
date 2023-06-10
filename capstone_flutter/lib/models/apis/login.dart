import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../user_model.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<User?> loginUser(String email, String password) async {
    final url = Uri.parse('http://34.101.160.237:2424/api/v1/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email, 'password': password});
    print(email);
    print(password);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print('Response body: ${response.body}');
      final user = User.fromJson(jsonData);
      saveUserInfoToSharedPreferences(
          user.name, user.phone, user.email, user.token);
      print(user.phone);
      print(user.name);
      print(user.email);
      print(user.token);
      return user;
    } else {
      print('Response body: ${response.body}');
      return null;
    }
  }

  void saveUserInfoToSharedPreferences(
      String name, String phone, String email, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('phone', phone);
    await prefs.setString('email', email);
    await prefs.setString('token', token);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
