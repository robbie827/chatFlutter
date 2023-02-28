import 'dart:convert';

import 'package:chatflutter/models/data_model.dart';
import 'package:chatflutter/models/favorites_model.dart';
import 'package:chatflutter/models/messages_model.dart';
import 'package:chatflutter/models/send_message_model.dart';
import 'package:chatflutter/models/user_model.dart';
import 'package:http/http.dart';
import 'package:chatflutter/models/chat_users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final baseUrl = 'http://wh.saas.test/geniusBankWallet/api/user';

  Future<String> login(String email, password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response = await post(Uri.parse('$baseUrl/login'), body: {
        'email': email,
        'password': password,
        'device_name': "postman"
      });
      if (response.statusCode == 200) {
        var token = json.decode(response.body)["access_token"];
        prefs.setString('token', token);
        return 'success';
      } else {
        return 'failed';
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      Response response = await post(Uri.parse('$baseUrl/logout'));
      if (response.statusCode == 200) {
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
        return sendMessageFromJson(data);
      }
    } catch (e) {}
  }

  // file upload service
  Future<bool> addImage(Map<String, String> body, String filepath) async {
    String addimageUrl = '$baseUrl/sendMessage';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await MultipartFile.fromPath('image', filepath));

    var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> Star(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      Response response = await post(
        Uri.parse('$baseUrl/star'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "user_id": id.toString(),
        },
      );

      if (response.statusCode == 200) {
        var data = response.body;

        var result = jsonDecode(data);
      }
    } catch (e) {}
  }

  Future<DashboardModel?> getData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      Response response = await post(
        Uri.parse('$baseUrl/dashboard'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];
        return DashboardModel.fromJson(data);
      }
    } catch (e) {}
  }

  Future<String?> Delete(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      Response response = await post(
        Uri.parse('$baseUrl/deleteConversation'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "user_id": id.toString(),
        },
      );

      if (response.statusCode == 200) {
        return "success";
      } else {
        return 'failed';
      }
    } catch (e) {}
  }

  Future<UserModel?> GetInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      Response response = await post(
        Uri.parse('$baseUrl/idInfo'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)["fetch"];
        return UserModel.fromJson(data);
      }
    } catch (e) {}
  }

  Future<UserModel?> Profile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      Response response = await get(
        Uri.parse('$baseUrl/profile'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body)["user"];
        return UserModel.fromJson(data);
      }
    } catch (e) {}
  }

  Future<UserModel?> ProfileUpdate(
    String firstName,
    String lastName,
    String email,
    String birthday,
    String phone,
    String address,
    String zip,
    String city,
    String country,
    String personal,
    String yourId,
    String authority,
    String doi,
    String doe,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      Response response = await post(Uri.parse('$baseUrl/update'), headers: {
        'Authorization': 'Bearer $token',
      }, body: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'dob': birthday,
        'phone': phone,
        'company_address': address,
        'company_zipcode': zip,
        'company_city': city,
        'personal_code': personal,
        'your_id': yourId,
        'issued_authority': authority,
        'date_of_issue': doi,
        'date_of_expire': doe,
        'company_country': country,
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body)["data"];
        return UserModel.fromJson(data);
      }
    } catch (e) {}
  }
}
