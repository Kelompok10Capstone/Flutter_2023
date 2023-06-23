import 'package:dio/dio.dart';

import '../../utils/const/urls.dart';
import '../user_model.dart';

class CekPinApi {
  late String token;

  CekPinApi(
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

  Future<Response<Map<String, dynamic>>> _postRequest({
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

  Future<User> postCekPin(String pin) async {
    final result = await _postRequest(
      endpoint: Urls.cekPin,
      body: {
        'pin': pin,
      },
    );
    // ignore: avoid_print
    print('result: $result');
    User response = User.fromJson(result.data!);

    return response;
  }
}
