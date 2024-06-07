import 'dart:convert';
import 'package:calenurse_app/domain/shift/exchange_shift.dart';
import 'package:calenurse_app/domain/shift/shift_area.dart';
import 'package:calenurse_app/services/api.dart';
import 'package:calenurse_app/domain/shift/generated_shift.dart';

class ShiftService {
  Api api = Api();

  Future<List<GeneratedShift>> getAssignedShiftsFromDate(
      String nurseId, DateTime date) async {
    final String formattedDate = date.toIso8601String();
    final String endpoint =
        '/shift/get-assigned-shifts-from-date?nurse_id=$nurseId&date=$formattedDate';

    final response = await api.get(endpoint);
    if (response.statusCode == 200) {
      // parse the response body
      List<dynamic> parsedJson = json.decode(response.body);
      return parsedJson.map((json) => GeneratedShift.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get shifts');
    }
  }

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

  Future<bool> postShiftExchange(String shiftA, String shiftB) async {
    final response = await api
        .post('/shift/exchange', {"shift_a": shiftA, "shift_b": shiftB});
    return response.statusCode == 201;
  }

  Future<List<ExchangeShift>> getListShiftExchange(String nurseId) async {
    final String endpoint = '/shift/exchange?nurse_id=$nurseId';
    final response = await api.get(endpoint);
    if (response.statusCode == 200) {
      // parse the response body
      List<dynamic> parsedJson = json.decode(response.body);
      return parsedJson.map((json) => ExchangeShift.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get list of exchange shifts');
    }
  }

  Future<bool> putShiftExchangeAccept(String exchangeId) async {
    final response =
        await api.put('/shift/exchange/accept', {"exchange_id": exchangeId});
    return response.statusCode == 200;
  }

  Future<bool> putShiftExchangeDecline(String exchangeId) async {
    final response =
        await api.put('/shift/exchange/decline', {"exchange_id": exchangeId});
    return response.statusCode == 200;
  }
}
