import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_model/user_provider/user_provider.dart';
import '../user_model.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<User?> loginUser(
      String email, String password, BuildContext context) async {
    final url = Uri.parse('http://34.101.78.228:2424/api/v1/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email, 'password': password});
    // ignore: avoid_print
    print(email);
    // ignore: avoid_print
    print(password);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // ignore: avoid_print
      print('Response body: ${response.body}');
      final user = User.fromJson(jsonData);
      saveUserInfoToSharedPreferences(user.token);

      // Mengirim permintaan ke URL lain saat login berhasil
      final profileUrl = Uri.parse('http://34.101.78.228:2424/api/v1/profile');
      final profileHeaders = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${user.token}', // Menggunakan token JWT pada header
      };
      final profileResponse =
          await http.get(profileUrl, headers: profileHeaders);

      if (profileResponse.statusCode == 200) {
        final profileJsonData = jsonDecode(profileResponse.body);
        // ignore: avoid_print
        print('Profile Response body: ${profileResponse.body}');
        final userId = User.fromJson(profileJsonData);
        // ignore: use_build_context_synchronously
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUserInfo(userId.name, userId.phone, userId.balance);

        saveUserInfoToSharedPreferences2(
          userId.name,
          userId.phone,
          userId.email,
          userId.balance,
        ); // Menggunakan model UserId
        // ignore: avoid_print
        print(userId.phone);
        // ignore: avoid_print
        print(userId.name);
        // ignore: avoid_print
        print(userId.email);
        // ignore: avoid_print
        print(userId.balance);
        // ignore: avoid_print
        print(userId.pin);
        // Proses data profile sesuai kebutuhan
      } else {
        // ignore: avoid_print
        print('Profile Response body: ${profileResponse.body}');
      }
      // ignore: avoid_print
      print(user.token);
      return user;
    } else {
      // ignore: avoid_print
      print('Response body: ${response.body}');
      return null;
    }
  }

  void saveUserInfoToSharedPreferences(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  void saveUserInfoToSharedPreferences2(
      String name, String phones, String email, double balance) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('phone', phones);
    await prefs.setString('email', email);
    await prefs.setDouble('balance', balance);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
