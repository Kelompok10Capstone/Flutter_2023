import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> checkPinStatus(String token) async {
  final profileUrl = Uri.parse('http://34.101.160.237:2424/api/v1/profile');
  final profileHeaders = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final profileResponse = await http.get(profileUrl, headers: profileHeaders);

  if (profileResponse.statusCode == 200) {
    final profileJsonData = jsonDecode(profileResponse.body);
    final pin = profileJsonData['data']['pin'] as String;
    final isPinCreated = pin.isNotEmpty;
    return isPinCreated;
  } else {
    // Handle error when retrieving profile data
    print('Failed to retrieve profile');
    return false;
  }
}
