import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import '../storage/localstorage.dart';


class PostApi {
  static Future getPosts() {
    return http.get(Uri.parse('http://127.0.0.1:3000/get/posts'));
  }
  static Future getsinglePosts()async {
    var token = await TokenStorage.getCompanyToken();
    Map<String, dynamic> payload =  Jwt.parseJwt(token.toString());
    String companyid =  payload.values.toList()[0];
    return http.get(Uri.parse('http://127.0.0.1:3000/get/posts/$companyid'));
  }
}