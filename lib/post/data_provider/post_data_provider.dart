import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/companies_post.dart';


class PostDataProvider {

  Future<String> create(String subject,String id,String description) async {
   final response = await http.post(
                                            Uri.parse(
                                                'http://127.0.0.1:3000/post'),
                                            headers: <String, String>{
                                              'Content-Type':
                                                  'application/json; charset=UTF-8',
                                            },
                                            body: jsonEncode(<String, String>{
                                              'company':id,
                                              'subject': subject,
                                              'description': description
                                            }),
                                          );

    if (response.statusCode == 200) {
      
      return (response.body).toString();
    }
    {
      throw Exception("Failed to create user");
    }
  }

  Future<Post> fetchBysubject(String subject) async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/get/post/$subject'));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  
  

  Future<Post> update(String id , String subject,String description,String companyid) async {
                                  final response = await http.put(
                                    Uri.parse('http://127.0.0.1:3000/put/post/${id}'),
                                    headers: <String, String>{
                                      'Content-Type':
                                          'application/json; charset=UTF-8',
                                          
                                    },
                                    body: jsonEncode(<String, String>{
                                      'subject':subject,
                                      'description':description,
                                      
                                    }),
                                  );

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the course");
    }
  }

  Future<void> delete(String subject) async {
   await http.delete(
                                Uri.parse('http://127.0.0.1:3000/delete/post/$subject'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                      
                                },  
                              
                              );
}
 Future<List<Post>> fetchAll() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:3000/get/posts/'));
    if (response.statusCode == 200) {
      final postes = jsonDecode(response.body) as List;
      return postes.map((c) => Post.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch postes");
    }
  }
 Future<List<Post>> fetchbycompanyname(String companyid) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:3000/get/posts/$companyid'));
    if (response.statusCode == 200) {
      final posts = jsonDecode(response.body) as List;
      return posts.map((c) => Post.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch postes");
    }
  }
}