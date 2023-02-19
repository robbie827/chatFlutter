import 'package:flutter/cupertino.dart';

class ChatUser {
  String name;
  String? messageText;
  String? imageURL;
  String? time;
  ChatUser({
    required this.name,
    this.messageText,
    this.imageURL,
    this.time,
  });
}
