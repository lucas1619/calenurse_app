class User {
  String id;
  String name;
  String email;
  String type;
  String area;
  String photoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.area,
    required this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print(json['area']['name']);
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      type: json['isBoss'] ? 'Jefa de Enfermeras' : 'Enfermera',
      area: json['area']['name'] as String,
      photoUrl: 'https://i.stack.imgur.com/4Bl5y.jpg',
    );
  }
}
