class Pacote {
  final int id;
  final String content;
  final String status;
  final int userId;
  final String createdAt;
  final String updatedAt;


  const Pacote({
    this.id = 0,
    required this.content,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt
  });

  factory Pacote.fromJson(Map<dynamic, dynamic> json) {
    return Pacote(
      id: json['id'],
      content: json['content'],
      status: json['status'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['status'] = status;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}