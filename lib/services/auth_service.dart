// import 'dart:ffi';

// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:calenurse_app/services/api.dart';
import 'package:calenurse_app/domain/user/user.dart';
import 'package:http/http.dart';

class AuthService {
  Api api = Api();
  Future<User> login(String username, String password) async {
    final response = await api
        .post('/auth/login', {'username': username, 'password': password});
    if (response.statusCode == 200) {
      // parse the response body
      final parsedJson = json.decode(response.body);
      String token = parsedJson['token'];
      api.addHeader('Authorization', token);
      return User.fromJson(parsedJson['user']['nurse']);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Response> register(Map<String, Object> body) async {
    final response = await api.post('/auth/signup', body);
    return response;
  }
}
