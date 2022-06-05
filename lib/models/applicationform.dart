import 'package:mynotes/models/company.dart';
import 'users.dart';


class Application {
  User user;
  String cgpa;
  String description;
  String Subject;
  Company company;
  String Seen;

  // Application.fromJson(Map json)
  //     : user = User.fromJson(json['user']),
  //       cgpa = json['cgpa'],
  //       description = json['description'],
  //       Subject=json['Subject'],
  //       Seen=json['Seen'],
  //   company_name=json['company_name'];
      


  // Map toJson() {
  //   return {
      
  //     'user': user,
  //     'cgpa': cgpa,
  //     'description': description,
  //     'Subject':Subject,
  //     'Seen':Seen,
  //     'company_name':company_name
  //   };
  // }

Application({
    required this.user,
    required this.cgpa,
     this.Seen='none',
    required this.Subject,
    required this.company,
    required this.description,
  });
  factory Application.fromJson(Map<String, dynamic> json) {
      return Application(
       user :User.fromJson(json['user']),
        cgpa : json['cgpa'],
        description : json['description'],
        Subject:json['Subject'],
        Seen:json['Seen'],
     company :Company.fromJson(json['company']));
  }


}

