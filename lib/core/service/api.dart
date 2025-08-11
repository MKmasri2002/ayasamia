import 'dart:convert';

import 'package:advisor1/core/service/api_string.dart';
import 'package:advisor1/models/userModel.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(ApiString.baseURL + ApiString.login);
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        print("login successfully");
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        print("wrong email or password");
        return null;
      }
    } catch (e) {
      print("mk error : " + e.toString());
    }
    return null;
  }
}
