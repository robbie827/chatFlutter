List<MessageModel> messageFromJson(data) =>
    List<MessageModel>.from(data.map((x) => MessageModel.fromJson(x)));

class MessageModel {
  int? id;
  String? type;
  int? fromId;
  int? toId;
  String? body;
  String? attachment;
  int? seen;
  String? createdAt;
  String? updatedAt;

  MessageModel({
    this.id,
    this.type,
    this.fromId,
    this.toId,
    this.body,
    this.attachment,
    this.seen,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"] ?? "",
      type: json["type"] ?? "",
      fromId: json["from_id"] ?? "",
      toId: json["to_id"] ?? "",
      body: json["body"] ?? "",
      attachment: json["attachment"] ?? "",
      seen: json["seen"] ?? "",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
    );
  }
}
