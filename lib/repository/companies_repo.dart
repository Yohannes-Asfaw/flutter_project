import 'dart:async';
import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mynotes/models/company.dart';
import 'package:mynotes/storage/localstorage.dart';
import 'package:mynotes/views/login.dart';

class CompanyApi {
  static Future getCharacters() {
    return http.get(Uri.parse('http://127.0.0.1:3000/get/companies'));
  }

  static Future<Company> getCompany() async {
    var token = await TokenStorage.getCompanyToken('company_token');
    Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
    var id = payload.values.toList()[0];
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/get/company/$id'));

    if (response.statusCode == 200) {
      return Company.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
