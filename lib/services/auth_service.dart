// import 'dart:ffi';

// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:calenurse_app/services/api.dart';
import 'package:calenurse_app/domain/user/user.dart';

class AuthService extends Api {
  Future<User> login(String username, String password) async {
    final response =
        await post('/auth/login', {'username': username, 'password': password});
    if (response.statusCode == 200) {
      // parse the response body
      final parsedJson = json.decode(response.body);
      // parse string to json
      return User.fromJson(parsedJson['user']['nurse']);
    } else {
      throw Exception('Failed to login');
    }
  }

  // Future<User> register(String name, String username, String password) async {
  bool register(Map<String, Object> body) {
    post('/auth/signup', body).then((response) {
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    });
    return false;
  }
}
