class AreaNurse {
  String id;
  String name;

  AreaNurse({required this.id, required this.name});

  factory AreaNurse.fromJson(Map<String, dynamic> json) {
    return AreaNurse(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  @override
  String toString() {
    return name; // Or return any other string representation you prefer
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AreaNurse && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
