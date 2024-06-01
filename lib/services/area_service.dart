// import 'dart:ffi';

// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:calenurse_app/domain/area/area_nurse.dart';
import 'package:calenurse_app/services/api.dart';
import 'package:calenurse_app/domain/area/area.dart';

class AreaService {
  Api api = Api();
  Future<List<Area>> getAllAreas() async {
    final response = await api.get('/area/all');
    if (response.statusCode == 200) {
      // parse the response body
      List<dynamic> parsedJson = json.decode(response.body);
      return parsedJson.map((json) => Area.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get all areas');
    }
  }

  Future<List<AreaNurse>> getAllUsersFromArea(
      String areaId, String userId) async {
    final String endpoint = '/area/nurses?area_id=$areaId&user_id=$userId';
    final response = await api.get(endpoint);
    if (response.statusCode == 200) {
      // parse the response body
      List<dynamic> parsedJson = json.decode(response.body);
      return parsedJson.map((json) => AreaNurse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get all areas');
    }
  }
}
