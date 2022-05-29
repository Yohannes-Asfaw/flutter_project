
import 'package:mynotes/models/users.dart';

class Application {
  User user;
  String cgpa;
  String description;
  String Subject;
  String company_name;
  String Seen;

  Application.fromJson(Map json)
      : user = User.fromJson(json['user']),
        cgpa = json['cgpa'],
        description = json['description'],
        Subject=json['Subject'],
        Seen=json['Seen'],
    company_name=json['company_name'];
      


  Map toJson() {
    return {
      
      'user': user.toJson(),
      'cgpa': cgpa,
      'description': description,
      'Subject':Subject,
      'Seen':Seen,
      'company_name':company_name
    };
  }
}
