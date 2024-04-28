class ScheduleFromList {
  final String id;
  final String day;
  final String startTime;
  final String endTime;
  final String shift;

  ScheduleFromList(
      {required this.id,
      required this.day,
      required this.startTime,
      required this.endTime,
      required this.shift});

  factory ScheduleFromList.fromJson(Map<String, dynamic> json) {
    return ScheduleFromList(
      id: json['id'],
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      shift: json['shift'],
    );
  }
}
