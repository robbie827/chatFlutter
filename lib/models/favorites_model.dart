import 'package:chatflutter/models/chat_users_model.dart';

List<FavoriteModel> favoritesModelFromJson(data) =>
    List<FavoriteModel>.from(data.map((x) => FavoriteModel.fromJson(x)));

class FavoriteModel {
  int id;
  int userId;
  int favoriteId;
  String createdAt;
  String updatedAt;
  ChatUser? user;

  FavoriteModel({
    required this.id,
    required this.userId,
    required this.favoriteId,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json["id"],
      userId: json["user_id"],
      favoriteId: json["favorite_id"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      user: ChatUser.fromJson(json["user"]),
    );
  }
}
