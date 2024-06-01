import 'dart:convert';
import 'package:calenurse_app/domain/shift/shift_area.dart';
import 'package:calenurse_app/services/api.dart';
import 'package:calenurse_app/domain/shift/generated_shift.dart';

class ShiftService {
  Api api = Api();

  Future<List<GeneratedShift>> getShift(String nurseId, DateTime date) async {
    final String formattedDate = date.toIso8601String();
    final String endpoint =
        '/shift/assigned?nurse_id=$nurseId&date=$formattedDate';

    final response = await api.get(endpoint);
    if (response.statusCode == 200) {
      // parse the response body
      List<dynamic> parsedJson = json.decode(response.body);
      return parsedJson.map((json) => GeneratedShift.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get shifts');
    }
  }

  Future<List<ShiftArea>> getShiftArea(String bossId, DateTime date) async {
    final String formattedDate = date.toIso8601String();
    final String endpoint = '/shift/area?boss_id=$bossId&date=$formattedDate';

    final response = await api.get(endpoint);
    if (response.statusCode == 200) {
      // parse the response body
      List<dynamic> parsedJson = json.decode(response.body);
      return parsedJson.map((json) => ShiftArea.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get shifts from area');
    }
  }
}
