import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl =
      'http://10.0.2.2:3000/api/users'; // Sesuaikan URL backend Anda

  Future<String> signup(
      {required String email, required String password}) async {
    final url = Uri.parse('$baseUrl/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 201) {
      return responseData['message'];
    } else {
      throw Exception(responseData['message'] ?? 'Pendaftaran gagal');
    }
  }

  Future<String> login(
      {required String email, required String password}) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return responseData['message'];
    } else {
      throw Exception(responseData['message'] ?? 'Login gagal');
    }
  }
}
