List<ChatUser> chatUserFromJson(data) =>
    List<ChatUser>.from(data.map((x) => ChatUser.fromJson(x)));

class ChatUser {
  int id;
  String name;
  String? companyName;
  String? photo;

  ChatUser({
    required this.id,
    required this.name,
    this.companyName,
    this.photo,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json["id"],
      name: json["name"],
      companyName: json["company_name"],
      photo: json["photo"],
    );
  }
}
