import 'dart:io';
import 'package:dio/dio.dart';

import '../../utils/const/urls.dart';
import '../network_respone.dart';
import '../pulsa_paket_data.dart';

class PulsaPaketDataApi {
  late String token;

  PulsaPaketDataApi(this.token);

  Dio dioApi() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://be-golang.kucinghitam.tech/api/v1/user/ppd',
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
      endpoint: '',
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
      // Tangani error sesuai kebutuhan
      rethrow;
    }
  }

  // Future<NetworkResponse> _getRequest({endpoint, param}) async {
  //   try {
  //     final dio = dioApi();
  //     final result = await dio.get(endpoint, queryParameters: param);
  //     return NetworkResponse.success(result.data);
  //     // ignore: deprecated_member_use
  //   } on DioError catch (e) {
  //     // ignore: deprecated_member_use
  //     if (e.type == DioErrorType.sendTimeout) {
  //       return NetworkResponse.error(data: null, message: "request timeout");
  //     }
  //     return NetworkResponse.error(data: null, message: "request error dio");
  //   } catch (e) {
  //     return NetworkResponse.error(data: null, message: "other error");
  //   }
  // }

  // Future<NetworkResponse> getPulsaPaketData() async {
  //   final result = await _getRequest(
  //     endpoint: Urls.pulsapaketdataList,
  //     param: {
  //       'type': 'paket_data',
  //       'provider': 'telkomsel',
  //     },
  //   );
  // }
}
