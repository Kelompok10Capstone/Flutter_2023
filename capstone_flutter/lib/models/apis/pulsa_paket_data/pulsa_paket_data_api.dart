import 'package:dio/dio.dart';
import '../../../utils/const/urls.dart';
import '../../pulsa_paket_data.dart';

class PulsaPaketDataApi {
  late String token;
  // final String paketdata;
  // final String productid;
  // final String discountid;
  // final String phonenumber;

  PulsaPaketDataApi(
    this.token,
    // this.paketdata,
    // this.productid,
    // this.discountid,
    // this.phonenumber,
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

  Future<PulsaPaketDataResponse> getPulsaPaketData(String phone) async {
    final result = await _getRequest(
      endpoint: Urls.pulsapaketdataList,
      params: {
        // 'type': 'paket_data',
        // 'provider': 'telkomsel',
        'phone_number': phone,
      },
    );
    print('result: $result');
    PulsaPaketDataResponse response =
        PulsaPaketDataResponse.fromJson(result.data!);

    return response;
  }

  // Future<PulsaPaketDataResponse> postPulsaPaketData() async {
  //   final result = await _postRequest(
  //     endpoint: Urls.pulsapaketdataList,
  //     body: {
  //       "type": paketdata,
  //       "product_id": productid,
  //       "discount_id": discountid,
  //       "phone_number": phonenumber,
  //     },
  //   );
  //   PulsaPaketDataResponse response =
  //       PulsaPaketDataResponse.fromJson(result.data!);

  //   return response;
  // }

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

  // Future<Response<Map<String, dynamic>>> _postRequest({
  //   required String endpoint,
  //   Map<String, dynamic>? params,
  //   Map<String, dynamic>? body,
  // }) async {
  //   Dio dio = dioApi();
  //   try {
  //     Response<Map<String, dynamic>> response = await dio.post(
  //       endpoint,
  //       queryParameters: params,
  //       data: body,
  //     );
  //     return response;
  //   } catch (e) {
  //     if (e is DioException) {
  //       print(e.response?.data);
  //     }
  //     rethrow;
  //   }
  // }
}
