import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mynotes/models/company.dart';
import 'package:mynotes/models/users.dart';

import '../../../storage/localstorage.dart';


class Loginprovider{
    Future<dynamic> login(String username,String password) async {
    final response = await http.post(
                              Uri.parse('http://127.0.0.1:3000/login/user'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'password': password,
                                'user_name': username,
                                
                              }),
                            );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      final String token = data['token'];
      final User user = User.fromJson(data['user']);
      await TokenStorage.saveUserToken(user.id);
     
      
      return user;
    
     
    }
    else
    {
      throw Exception("Failed to login");
    }
  }
    Future<dynamic> companylogin(String companyname,String password) async {
    final response = await http.post(
                              Uri.parse('http://127.0.0.1:3000/login/company'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'password': password,
                                'company_name': companyname,
                                
                              }),
                            );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      final String token = data['token'];
      final Company company = Company.fromJson(data['company']);
      await TokenStorage.saveCompanyToken(token);
     
      return company;
    
     
    }
    else
    {
      throw Exception("Failed to login");
    }
  }
}