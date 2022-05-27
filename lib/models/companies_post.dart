import 'company.dart';

class Post {
  Company company;
  String subject;
  String description;

  Post.fromJson(Map json)
      : company=Company.fromJson(json['company']),
        subject=json['subject'],
        description=json['description'];


  Map toJson() {
    return {
      'company':company.toJson(),
      'subject':subject,
      'description':description 
    };
  }
}
