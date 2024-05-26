import 'package:calenurse_app/domain/shift/shift_enum.dart';

class GeneratedShift {
  String id;
  DateTime date;
  ShiftEnum shift;

  GeneratedShift({required this.id, required this.date, required this.shift});

  factory GeneratedShift.fromJson(Map<String, dynamic> json) {
    return GeneratedShift(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      shift: ShiftEnum.values
          .firstWhere((e) => e.toString() == 'ShiftEnum.${json['shift']}'),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeneratedShift && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
