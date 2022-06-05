import 'package:flutter_secure_storage/flutter_secure_storage.dart';
 const _storage = FlutterSecureStorage();
class TokenStorage {
  
  static const _usertoken = "user_token";
    static const _user = "user";

  static Future saveUserToken(String token) async =>
      await _storage.write(key: _usertoken, value: token);
   static Future saveUser(String user) async =>
      await _storage.write(key: _user, value: user);
      

  static Future<String?> getUserToken(String token) async =>
      await _storage.read(key: _usertoken);
      
  static Future<String?> getUser(String token) async =>
      await _storage.read(key: _user);

  static const _companytoken = "company_token";
    static const _company = "company";

  static Future saveCompanyToken(String token) async =>
      await _storage.write(key: _companytoken, value: token);
      static Future saveCompany(String company) async =>
      await _storage.write(key: _company, value: company);

  static Future<String?> getCompanyToken() async =>
     await _storage.read(key: _companytoken);
     
  static Future<String?> getCompany() async =>
     await _storage.read(key: _company);
}
