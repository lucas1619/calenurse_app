class ShiftArea {
  final String shiftType;
  final List<String> nurses;

  ShiftArea({required this.shiftType, required this.nurses});

  factory ShiftArea.fromJson(Map<String, dynamic> json) {
    return ShiftArea(
      shiftType: json['shiftType'],
      nurses: List<String>.from(json['nurses']),
    );
  }
}
