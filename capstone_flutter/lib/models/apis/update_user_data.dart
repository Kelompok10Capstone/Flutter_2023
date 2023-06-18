import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateUserController {
  late String token;

  UpdateUserController(this.token);

  Future<bool> updateUserById(String name, String email, String phone) async {
    final url = Uri.parse('http://34.101.78.228:2424/api/v1/user');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'name': name, 'email': email, 'phone': phone});

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
