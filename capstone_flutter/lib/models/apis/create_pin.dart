import 'dart:convert';
import 'package:http/http.dart' as http;

class PinController {
  late String token;

  PinController(this.token);

  Future<bool> createPin(String pin) async {
    final url = Uri.parse('http://34.101.160.237:2424/api/v1/user/pin');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'pin': pin});

    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('berhasil: ${response.body}');
      return true;
    } else {
      print('gagal: ${response.body}');
      return false;
    }
  }
}
