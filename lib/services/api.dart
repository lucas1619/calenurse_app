import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  // TODO: Cambiar por la dirección de la API
  static const String _baseUrl = 'http://3.208.8.204:3000/api/v1';

  Future<http.Response> get(String path) async {
    final headers = {'Content-Type': 'application/json'};
    return await http.get(Uri.parse(_baseUrl + path), headers: headers);
  }

  Future<http.Response> post(String path, dynamic body_) async {
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(body_);
    return await http.post(Uri.parse(_baseUrl + path),
        headers: headers, body: body);
  }

  Future<http.Response> put(String path, dynamic body_) async {
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(body_);
    return await http.put(Uri.parse(_baseUrl + path),
        body: body, headers: headers);
  }

  Future<http.Response> delete(String path) async {
    return await http.delete(Uri.parse(_baseUrl + path));
  }

  Future<http.Response> patch(String path, dynamic body_) async {
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(body_);
    return await http.patch(Uri.parse(_baseUrl + path),
        body: body, headers: headers);
  }
}
