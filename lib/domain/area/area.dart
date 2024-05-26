class Area {
  String id;
  String name;

  Area({required this.id, required this.name});

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
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
    return other is Area && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
