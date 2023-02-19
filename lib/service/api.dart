import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final base_url = 'http://127.0.0.1:8000';

  Future<String> login(String email, password) async {
    try {
      Response response = await post(Uri.parse('$base_url/chatify/api/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['access_token']);
        return 'success';
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
