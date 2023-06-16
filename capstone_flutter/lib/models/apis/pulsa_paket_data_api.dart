import 'package:dio/dio.dart';
import '../../utils/const/urls.dart';
import '../pulsa_paket_data.dart';

class PulsaPaketDataApi {
  late String token;

  PulsaPaketDataApi(this.token);

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

  Future<PulsaPaketDataResponse> getPulsaPaketData(String query) async {
    final result = await _getRequest(
      endpoint: Urls.pulsapaketdataList,
      params: {
        'type': 'paket_data',
        'provider': 'telkomsel',
      },
    );
    PulsaPaketDataResponse response =
        PulsaPaketDataResponse.fromJson(result.data!);

    return response;
  }

  Future<Response<Map<String, dynamic>>> _getRequest({
    required String endpoint,
    Map<String, dynamic>? params,
  }) async {
    Dio dio = dioApi();
    try {
      Response<Map<String, dynamic>> response =
          await dio.get(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
      }
      rethrow;
    }
  }
}

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class PulsaPaketDataApi {
//   late String token;

//   PulsaPaketDataApi(this.token);

//   Future<http.Response> _getRequest({
//     required String endpoint,
//     Map<String, String>? params,
//   }) async {
//     final url = Uri.parse(endpoint);
//     final response = await http.get(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );

//     return response;
//   }

//   Future<PulsaPaketDataResponse> getPulsaPaketData(String query) async {
//     final result = await _getRequest(
//       endpoint: Urls.pulsapaketdataList,
//       params: {
//         'type': 'paket_data',
//         'provider': 'telkomsel',
//       },
//     );

//     if (result.statusCode == 200) {
//       final responseData = json.decode(result.body);
//       PulsaPaketDataResponse response =
//           PulsaPaketDataResponse.fromJson(responseData);
//       return response;
//     } else {
//       throw Exception('Failed to get pulsa paket data');
//     }
//   }
// }
