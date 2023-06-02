import 'dart:convert';
import 'dart:io';
import 'package:capstone_flutter/utils/const/theme.dart';
import 'package:capstone_flutter/view/screen/home_screen/home_screen.dart';
import 'package:capstone_flutter/view/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http_io;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmail(BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);

      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };

      // Create an IOClient with a HttpClient that ignores certificate verification
      http.Client client = http_io.IOClient(
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true,
      );

      http.Response response = await client.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      // print('Response status code: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['metadata']?['status'] == 200) {
          var data = json['data'];
          var token = data['token'];

          // print(token);

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);

          emailController.clear();
          passwordController.clear();

          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NavBar()),
            (route) => false,
          );
        } else {
          var errorMessage = json['metadata']?['message']?.toString() ??
              "Unknown Error Occurred";
          throw errorMessage;
        }
      } else {
        var errorMessage = jsonDecode(response.body)?["message"]?.toString() ??
            "Email or password is incorrect!";
        throw errorMessage;
      }
    } catch (e) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'Error',
              style: blackFont18,
            ),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}

class ApiEndPoints {
  static const String baseUrl = 'https://34.101.160.237:2424/api/v1/';
  // ignore: library_private_types_in_public_api
  static _AuthEndPoints authEndpoints = _AuthEndPoints();

  static Future<String> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}

class _AuthEndPoints {
  final String registerEmail = 'register';
  final String loginEmail = 'login';
}
