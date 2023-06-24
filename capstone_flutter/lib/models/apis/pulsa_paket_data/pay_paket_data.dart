import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../utils/const/urls.dart';
import '../../pay_ppd_models.dart';

// class PayPaketData {
//   static const baseUrl = 'http://34.101.78.228:2424/api/v1/user/ppd';

//   // Fungsi untuk create transaction
//   static Future<CreateTransaksiData> createTransaksiPPd(
//     String token,
//     String type,
//     String phoneNumber,
//     String productId,
//     String discontId,
//   ) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: json.encode({
//         'type': type,
//         'phone_number': phoneNumber,
//         'product_id': productId,
//         'discont_id': discontId,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return CreateTransaksiData.fromJson(data['data']);
//     } else {
//       throw Exception('Gagal membuat transaksi');
//     }
//   }
// }

class PayPaketData {
  late String token;

  PayPaketData(
    this.token,
  );

  Dio dioApi() {
    BaseOptions options = BaseOptions(
      baseUrl: Urls.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      responseType: ResponseType.json,
    );
    final dio = Dio(options);
    return dio;
  }

  Future<Response<Map<String, dynamic>>> _postCreateTransaksiPpd({
    required String endpoint,
    Map<String, dynamic>? body,
  }) async {
    Dio dio = dioApi();
    try {
      Response<Map<String, dynamic>> response =
          await dio.post(endpoint, data: body);
      return response;
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print(e.response?.data);
      }
      rethrow;
    }
  }

  Future<CreateTransaksiData> postcreateTransaksiPPd(
    String type,
    String phoneNumber,
    String productId,
    String discontId,
  ) async {
    final result = await _postCreateTransaksiPpd(
      endpoint: Urls.pulsapaketdataList,
      body: {
        'type': type,
        'phone_number': phoneNumber,
        'product_id': productId,
        'discont_id': discontId,
      },
    );
    // ignore: avoid_print
    print('result: $result');
    CreateTransaksiData response = CreateTransaksiData.fromJson(result.data!);

    return response;
  }
}
