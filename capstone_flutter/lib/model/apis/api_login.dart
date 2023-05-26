import 'package:http/http.dart' as http;

Future<void> login(String email, String password) async {
  var url = Uri.parse('https://example.com/api/login');
  var response = await http.post(
    url,
    body: {
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    // Berhasil, lakukan sesuatu dengan respons dari backend
    print(response.body);
  } else {
    // Gagal, tangani kesalahan
    print('Gagal login. Status code: ${response.statusCode}');
  }
}
