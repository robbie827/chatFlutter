import 'dart:convert';
import 'dart:math';
import 'package:chatflutter/models/favorites_model.dart';
import 'package:chatflutter/models/messages_model.dart';
import 'package:chatflutter/models/send_message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:chatflutter/models/chat_users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final baseUrl = 'http://wh.saas.test/geniusBankWallet/api';

  Future<String> login(String email, password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response = await post(Uri.parse('$baseUrl/user/login'), body: {
        'email': email,
        'password': password,
        'device_name': "android"
      });
      if (response.statusCode == 200) {
        var token = response.body;
        prefs.setString('token', token);
        return 'success';
      } else {
        return 'failed';
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<FavoriteModel>?> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      Response response = await post(
        Uri.parse('$baseUrl/favorites'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['favorites'];
        return favoritesModelFromJson(data);
      }
    } catch (e) {}
  }

  Future<List<ChatUser>?> getContacts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      Response response = await get(
        Uri.parse('$baseUrl/getContacts'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['contacts'];
        return chatUserFromJson(data);
      }
    } catch (e) {}
  }

  Future<List<ChatUser>?> getUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      Response response = await get(
        Uri.parse('$baseUrl/alluser'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['users'];
        return chatUserFromJson(data);
      }
    } catch (e) {}
  }

  Future<List<MessageModel>?> getMessages(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      Response response = await post(
        Uri.parse('$baseUrl/fetchMessages'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "id": id.toString(),
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['messages'];
        return messageFromJson(data);
      }
    } catch (e) {}
  }

  Future<List<SendMessageModel>?> sendMessage(
    int id,
    String type,
    String message,
    String temporaryMsgId,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      Response response = await post(
        Uri.parse('$baseUrl/sendMessage'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "id": id.toString(),
          "type": type,
          "message": message,
          "temporaryMsgld": temporaryMsgId,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['message'];
        print(data);
        return sendMessageFromJson(data);
      }
    } catch (e) {}
  }
}
