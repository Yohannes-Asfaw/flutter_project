import 'dart:async';
import 'package:http/http.dart' as http;


class PostApi {
  static Future getPosts() {
    return http.get(Uri.parse('http://127.0.0.1:3000/get/posts'));
  }
}