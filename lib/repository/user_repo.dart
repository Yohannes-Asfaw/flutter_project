import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import '../models/users.dart';
import '../storage/localstorage.dart';

class UserApi {
  static Future<User> getUser() async {
    var token = await TokenStorage.getUserToken('user_token');
    Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
    var id = payload.values.toList()[0];
    final response =
        await http.get(Uri.parse('http://10.0.2.2:3000/get/user/$id'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
