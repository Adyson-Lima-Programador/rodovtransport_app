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
}