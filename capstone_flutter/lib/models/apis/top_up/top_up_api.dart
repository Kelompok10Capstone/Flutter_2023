// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TopUpApi {
//   static const baseUrl = 'http://34.101.78.228:2424/api/v1/amount';

//   // final String codeBank;
//   final String token;

//   TopUpApi(
//     this.token,
//     // this.codeBank,
//   );

//   Future<String?> postTopUpApi(String codeBank) async {
//     final Map<String, dynamic> requestBody = {
//       "bank_code": codeBank,
//     };

//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: jsonEncode(requestBody),
//     );

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       final metadata = jsonData['metadata'];
//       print('Berhasil: ${response.statusCode}');
//       print('Response: ${response.body}');

//       if (metadata['status'] == 200) {
//         final topupId = jsonData['id'];
//         print('Berhasil: ${response.statusCode}');
//         print('Response: ${response.body}');

//         return topupId;
//       } else {
//         print('Payment failed: ${metadata['message']}');
//       }
//     } else {
//       print('error: ${response.statusCode}');
//     }
//   }
// }