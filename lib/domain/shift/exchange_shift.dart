class ExchangeShift {
  final String id;
  final bool state;
  final ShiftDetails shiftA;
  final ShiftDetails shiftB;

  ExchangeShift({
    required this.id,
    required this.state,
    required this.shiftA,
    required this.shiftB,
  });

  factory ExchangeShift.fromJson(Map<String, dynamic> json) {
    return ExchangeShift(
      id: json['id'],
      state: json['state'],
      shiftA: ShiftDetails.fromJson(json['shiftA']),
      shiftB: ShiftDetails.fromJson(json['shiftB']),
    );
  }

  @override
  String toString() {
    return 'ExchangeShift(id: $id, state: $state, shiftA: $shiftA, shiftB: $shiftB)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExchangeShift) return false;
    return id == other.id &&
        state == other.state &&
        shiftA == other.shiftA &&
        shiftB == other.shiftB;
  }

  @override
  int get hashCode =>
      id.hashCode ^ state.hashCode ^ shiftA.hashCode ^ shiftB.hashCode;
}

class ShiftDetails {
  final DateTime date;
  final String shift;
  final String nurseName;

  ShiftDetails({
    required this.date,
    required this.shift,
    required this.nurseName,
  });

  factory ShiftDetails.fromJson(Map<String, dynamic> json) {
    return ShiftDetails(
      date: DateTime.parse(json['date']),
      shift: json['shift'],
      nurseName: json['nurseName'],
    );
  }

  @override
  String toString() {
    return 'ShiftDetails(date: $date, shift: $shift, nurseName: $nurseName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShiftDetails) return false;
    return date == other.date &&
        shift == other.shift &&
        nurseName == other.nurseName;
  }

  @override
  int get hashCode => date.hashCode ^ shift.hashCode ^ nurseName.hashCode;
}
