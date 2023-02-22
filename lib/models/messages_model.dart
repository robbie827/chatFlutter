List<MessageModel> messageFromJson(data) =>
    List<MessageModel>.from(data.map((x) => MessageModel.fromJson(x)));

class MessageModel {
  int id;
  String type;
  int fromId;
  int toId;
  String body;
  String? attachment;
  int seen;
  String createdAt;
  String updatedAt;

  MessageModel({
    required this.id,
    required this.type,
    required this.fromId,
    required this.toId,
    required this.body,
    this.attachment,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"],
      type: json["type"],
      fromId: json["from_id"],
      toId: json["to_id"],
      body: json["body"],
      attachment: json["attachment"],
      seen: json["seen"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}
