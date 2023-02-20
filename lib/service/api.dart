import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  final base_url = 'http://wh.saas.test/geniusBankWallet/api';

  Future<String> login(String email, password) async {
    try {
      Response response = await post(Uri.parse('$base_url/user/login'), body: {
        'email': email,
        'password': password,
        'device_name': "android"
      });
      if (response.statusCode == 200) {
        var data = response.body;
        print(response.body);
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
