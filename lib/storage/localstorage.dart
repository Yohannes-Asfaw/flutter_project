import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();
  static const _usertoken = "user_token";
  static Future saveUserToken(String token) async =>
      await _storage.write(key: _usertoken, value: token);

  static Future<String?> getUserToken(String token) async =>
      _storage.read(key: _usertoken);

  static const _companytoken = "company_token";
  static Future saveCompanyToken(String token) async =>
      await _storage.write(key: _companytoken, value: token);

  static Future<String?> getCompanyToken(String token) async =>
      _storage.read(key: _companytoken);
}
