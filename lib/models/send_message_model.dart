List<SendMessageModel> sendMessageFromJson(data) =>
    List<SendMessageModel>.from(data.map((x) => SendMessageModel.fromJson(x)));

class SendMessageModel {
  String? index;
  int id;
  int fromId;
  int toId;
  String message;
  String time;
  String fullTime;
  String viewType;
  int seen;

  SendMessageModel({
    this.index,
    required this.id,
    required this.fromId,
    required this.toId,
    required this.message,
    required this.time,
    required this.fullTime,
    required this.viewType,
    required this.seen,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      index: json["index"],
      id: json["id"],
      fromId: json["from_id"],
      toId: json["to_id"],
      message: json["message"],
      time: json["time"],
      fullTime: json["fullTime"],
      viewType: json["viewType"],
      seen: json["seen"],
    );
  }
}
