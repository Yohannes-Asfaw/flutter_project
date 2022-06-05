import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/users.dart';

class UserDataProvider {

  Future<User> create(User user) async {
    final response = await http.post(
                              Uri.parse('http://127.0.0.1:3000/reg/user'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'password': user.Password,
                                'user_name': user.userName,
                                'full_name': user.fullName,
                                'department': user.department,
                                'Address': user.address,
                                'university': user.university
                              }),
                            );

    if (response.statusCode == 200) {
      
      return User.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create user");
    }
  }

  Future<User> fetchByuserName(String userName) async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/get/user/$userName'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  
  

  Future<User> update(String userName , User user) async {
    final response = await http.put(
                                Uri.parse('http://127.0.0.1:3000/put/user/${userName}'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                      
                                },
                                body: jsonEncode(<String, String>{
                                  'user_name': user.userName,
                                  'full_name': user.fullName,
                                  'department': user.department,
                                  'Address': user.address,
                                }),
                              );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the course");
    }
  }

  Future<void> delete(String userName) async {
   await http.delete(
                                Uri.parse('http://127.0.0.1:3000/delete/user/$userName'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                      
                                },  
                              
                              );
}
 Future<List<User>> fetchAll() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:3000/get/users/'));
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((c) => User.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch courses");
    }
  }
}