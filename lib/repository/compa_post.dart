import 'dart:async';
import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mynotes/models/company.dart';
import 'package:mynotes/storage/localstorage.dart';
import 'package:mynotes/views/login.dart';

class PostApi {
  static Future getPosts() {
    return http.get(Uri.parse('http://127.0.0.1:3000/get/posts'));
  }
}