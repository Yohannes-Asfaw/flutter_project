import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mynotes/models/applicationform.dart';

import '../../models/users.dart';

class AppDataProvider {

  Future<String> create(String id,String cgpa,String description,String Subject,String company_name ) async {
final response = await http.post(
      Uri.parse(
          'http://127.0.0.1:3000/apply'),
      headers: <String, String>{
        'Content-Type':
            'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user':id,
        'cgpa':cgpa,
        'description':description,
        'Subject':Subject,
        'company':company_name

      }),
    );

    if (response.statusCode == 200) {
      return (response.body).toString();
    }
    {
      throw Exception("not Application");
    }
  }

  Future<List<Application>> fetchByid(String id) async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/get/applications/$id'));
      if (response.statusCode==200){

     final apps = jsonDecode(response.body) as List;
     
      return apps.map((c) => Application.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch app");
    }}


   Future<Application> appEvaluation(String subject,String seen) async {
    final response =
        await http.put(Uri.parse('http://127.0.0.1:3000/put/application/$subject/$seen'));

    if (response.statusCode == 200) {
      
      return Application.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  
  



  Future<void> delete(String subject) async {
   await http.delete(
                                Uri.parse('http://127.0.0.1:3000/delete/application/$subject'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                      
                                },  
                              
                              );
}
 Future<List<Application>> fetchByCompanyname(String companyname) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:3000/get/application/$companyname'));
    if (response.statusCode == 200) {
      final apps = jsonDecode(response.body) as List;
     
      return apps.map((c) => Application.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch courses");
    }
  }
}