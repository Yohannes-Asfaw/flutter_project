import 'company.dart';

class Post {
  Company company;
  String subject;
  String description;
  String id;


  Post({
    required this.company,
    required this.subject,
    required this.description,
    this.id="1"
  });


factory Post.fromJson(Map<String, dynamic> json) {
      return Post(
          company:Company.fromJson(json['company']),
        subject:json['subject'],
        description:json['description'],
        id:json["_id"]);
        
  }


}
