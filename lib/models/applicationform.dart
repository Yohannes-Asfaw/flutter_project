import 'package:mynotes/models/users.dart';

class Application {
  User user;
  String cgpa;
  String description;
  String Subject;
  String company_name;

  Application.fromJson(Map json)
      : user = User.fromJson(json['user']),
        cgpa = json['cgpa'],
        description = json['description'],
        Subject=json['Subject'],
    company_name=json['company_name'];
      


  Map toJson() {
    return {
      
      'user': user.toJson(),
      'cgpa': cgpa,
      'description': description,
      'Subject':Subject,
      'company_name':company_name
    };
  }
}
