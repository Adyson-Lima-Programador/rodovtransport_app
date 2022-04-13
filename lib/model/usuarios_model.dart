class Usuario {
  final int id;
  final String email;
  final String name;
  final String password;
  final String category;
  final String created_at;
  final String updated_at;

  const Usuario(
      {this.id = 0,
      required this.email,
      required this.name,
      required this.password,
      required this.category,
      required this.created_at,
      required this.updated_at});

  factory Usuario.fromJson(Map<dynamic, dynamic> json) {
    return Usuario(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        password: json['password'],
        category: json['category'],
        created_at: json['created_at'],
        updated_at: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['category'] = this.category;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }
}
