class Usuario {
  final int id;
  final String email;
  final String name;
  final String password;
  final String category;
  final String createdAt;
  final String updatedAt;

  const Usuario(
      {this.id = 0,
      required this.email,
      required this.name,
      required this.password,
      required this.category,
      required this.createdAt,
      required this.updatedAt});

  factory Usuario.fromJson(Map<dynamic, dynamic> json) {
    return Usuario(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        password: json['password'],
        category: json['category'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    data['category'] = category;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
