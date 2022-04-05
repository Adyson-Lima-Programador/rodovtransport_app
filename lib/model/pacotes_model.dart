class Pacote {
  final int id;
  final String content;
  final String status;
  final int user_id;
  final String created_at;
  final String updated_at;


  const Pacote({
    this.id = 0,
    required this.content,
    required this.status,
    required this.user_id,
    required this.created_at,
    required this.updated_at
  });

  factory Pacote.fromJson(Map<dynamic, dynamic> json) {
    return Pacote(
      id: json['id'],
      content: json['content'],
      status: json['status'],
      user_id: json['user_id'],
      created_at: json['created_at'],
      updated_at: json['updated_at']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['status'] = this.status;
    data['user_id'] = this.user_id;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }
}