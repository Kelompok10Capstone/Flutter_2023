// ignore_for_file: avoid_print, unnecessary_nullable_for_final_variable_declarations, prefer_const_constructors

import 'dart:convert';
import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/screen/login_screen/login_screen.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //* Save Token
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail(BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);

      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };

      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['meta']['code'] == 200) {
          var token = json['data']['access_token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);

          emailController.clear();
          passwordController.clear();
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
            (route) => false,
          );
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(response.body)["message"] ??
            "Email atau password salah!";
      }
    } catch (e) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}

class ApiEndPoints {
  static final String baseUrl = 'https://pay.mjcreativa.com/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();

  static Future<String> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}

class _AuthEndPoints {
  final String registerEmail = 'register';
  final String loginEmail = 'login';
  final String getKaryawan = 'employee';
}
