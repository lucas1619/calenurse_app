import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomHttpClient extends http.BaseClient {
  final Map<String, String> defaultHeaders;

  final http.Client _httpClient = http.Client();

  CustomHttpClient(this.defaultHeaders);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // Agregar los encabezados por defecto a la solicitud
    request.headers.addAll(defaultHeaders);

    // Enviar la solicitud con los encabezados actualizados
    return _httpClient.send(request);
  }
}

class Api {
  static const String _baseUrl = 'https://calenurse.dns-dynamic.net/api/v1';

  final CustomHttpClient _client;

  // Instancia privada de la clase Api
  static final Api _instance = Api._internal();

  // Constructor privado
  Api._internal()
      : _client = CustomHttpClient({'Content-Type': 'application/json'});

  // Método para obtener la instancia única de la clase Api
  factory Api() {
    return _instance;
  }

  // add header
  void addHeader(String key, String value) {
    _client.defaultHeaders[key] = value;
  }

  Future<http.Response> get(String path) async {
    final url = Uri.parse(_baseUrl + path);
    return await _client.get(url);
  }

  Future<http.Response> post(String path, dynamic body_) async {
    final url = Uri.parse(_baseUrl + path);
    final body = json.encode(body_);
    return await _client.post(url, body: body);
  }

  Future<http.Response> put(String path, dynamic body_) async {
    final url = Uri.parse(_baseUrl + path);
    final body = json.encode(body_);
    return await _client.put(url, body: body);
  }

  Future<http.Response> delete(String path) async {
    final url = Uri.parse(_baseUrl + path);
    return await _client.delete(url);
  }

  Future<http.Response> patch(String path, dynamic body_) async {
    final url = Uri.parse(_baseUrl + path);
    final body = json.encode(body_);
    return await _client.patch(url, body: body);
  }
}
