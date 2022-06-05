import 'package:equatable/equatable.dart';

import '../../models/companies_post.dart';

abstract class PostEvent extends Equatable {

  const PostEvent();
   @override
  List<Object> get props => [];
}
class FetchBysubject extends PostEvent {
  final String subject;


  const FetchBysubject(this.subject);

  @override
  List<Object>  get props => [subject];

  @override
  String toString() => 'user accessed: $subject';
}



class PostCreate extends PostEvent {
  final String subject;
  final String id;
  final String description;

  const PostCreate(this.subject,this.id,this.description);

  @override
 List<Object>  get props => [id];

  @override
  String toString() => 'user Created {course Id: $id}';
}

class PostUpdate extends PostEvent {
  final String subject;
  final String description;
  final String id;
  final String Companyid;

  const PostUpdate(this.id,this.subject, this.description,this.Companyid);

  @override
  List<Object>  get props => [];

  @override
  String toString() => 'user Updated course Id ';
}

class PostDelete extends PostEvent {
  final String subject;
  final String id;
  const PostDelete(this.subject,this.id);

  @override
  List<Object> get props => [subject];

  @override
  toString() => 'user Deleted {course Id: $subject}';

  @override
  bool? get stringify => true;
}
class PostLoad extends PostEvent {
  const PostLoad();

  @override
  List<Object> get props => [];
}
class PostGetfromScreen extends PostEvent {
  final Post post;
  const PostGetfromScreen(this.post);

  @override
  List<Object> get props => [post];
}
class FetchByCompanyname extends PostEvent {
  
   final String companyname;



  const FetchByCompanyname(this.companyname);
  @override
  List<Object> get props => [companyname];
}