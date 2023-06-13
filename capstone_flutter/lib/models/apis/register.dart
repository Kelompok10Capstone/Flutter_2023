import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../user_model.dart';

class RegisterController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  Future<User?> registerUser(
      String name, String email, String phone, String password) async {
    final url = Uri.parse('http://34.101.160.237:2424/api/v1/register');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(
        {'name': name, 'email': email, 'phone': phone, 'password': password});

    print(name);
    print(email);
    print(password);
    print(phone);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      print('Response body: ${response.body}');
      return User.fromJson(jsonData);
    } else {
      print('Response body: ${response.body}');
      return null;
    }
  }

  void dispose() {}
}
