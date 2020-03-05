class ChatbotReply {
  final String reply;
  final List<dynamic> tones;
  ChatbotReply({this.reply, this.tones});

  factory ChatbotReply.fromJson(Map<String, dynamic> json) {
    return ChatbotReply(
      reply: json['reply'],
      tones: json['tone_id'],
    );
  }
}
