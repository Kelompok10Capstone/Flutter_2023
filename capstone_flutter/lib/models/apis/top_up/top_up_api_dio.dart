import 'package:dio/dio.dart';

import '../../../utils/const/urls.dart';
import '../../top_up_model.dart';

class TopUpDioDataApi {
  late String token;

  TopUpDioDataApi(this.token);

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

  Future<TopUpResponse> postTopUpApi(String codeBank) async {
    final result = await _postRequest(
      endpoint: Urls.topUp,
      params: {
        'bank_code': codeBank,
      },
    );
    TopUpResponse response = TopUpResponse.fromJson(result.data!);

    return response;
  }

  Future<Response<Map<String, dynamic>>> _postRequest({
    required String endpoint,
    Map<String, dynamic>? params,
  }) async {
    Dio dio = dioApi();
    try {
      Response<Map<String, dynamic>> response =
          await dio.post(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
      }
      rethrow;
    }
  }
}
