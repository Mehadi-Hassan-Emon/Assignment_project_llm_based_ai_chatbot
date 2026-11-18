class MessageEntity {
  final String role;//user
  final String text;
  final DateTime time;//date and time

  MessageEntity({
    required this.role,
    required this.text,
    required this.time
  });

  bool get isUser => role == 'user';
}