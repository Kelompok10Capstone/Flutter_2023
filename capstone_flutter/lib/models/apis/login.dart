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
      saveUserInfoToSharedPreferences(user.token);

      // Mengirim permintaan ke URL lain saat login berhasil
      final profileUrl = Uri.parse('http://34.101.160.237:2424/api/v1/profile');
      final profileHeaders = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${user.token}', // Menggunakan token JWT pada header
      };
      final profileResponse =
          await http.get(profileUrl, headers: profileHeaders);

      if (profileResponse.statusCode == 200) {
        final profileJsonData = jsonDecode(profileResponse.body);
        print('Profile Response body: ${profileResponse.body}');
        final userId = User.fromJson(profileJsonData);
        saveUserInfoToSharedPreferences2(
          userId.name,
          userId.phone,
          userId.email,
          userId.balance,
        ); // Menggunakan model UserId
        print(userId.phone);
        print(userId.name);
        print(userId.email);
        print(userId.balance);
        print(userId.pin);
        // Proses data profile sesuai kebutuhan
      } else {
        print('Profile Response body: ${profileResponse.body}');
      }
      print(user.token);
      return user;
    } else {
      print('Response body: ${response.body}');
      return null;
    }
  }

  void saveUserInfoToSharedPreferences(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  void saveUserInfoToSharedPreferences2(
      String name, String phones, String email, int balance) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('phone', phones);
    await prefs.setString('email', email);
    await prefs.setInt('balance', balance);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
