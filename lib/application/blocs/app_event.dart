import 'package:equatable/equatable.dart';
import 'package:mynotes/models/applicationform.dart';

import '../../models/users.dart';

abstract class AppEvent extends Equatable {

  const AppEvent();
   @override
  List<Object> get props => [];
}
class FetchBycompanyName extends AppEvent {
  final String companyName;


  const FetchBycompanyName(this.companyName);

  @override
  List<Object>  get props => [];

  @override
  String toString() => 'user accessed: $companyName';
}
class FetchByUserid extends AppEvent {
  final String id;
  const FetchByUserid(this.id);
  @override
  List<Object>  get props => [id];
  @override
  String toString() => 'user accessed: $id';
}

class AppCreate extends AppEvent {

  final String id;
  final String cgpa;
  final String description;
  final String Subject;
  final String company_name;

  const AppCreate(this.id,this.cgpa,this.description,this.Subject,this.company_name);

  @override
 List<Object>  get props => [];

  


}
class AppDelete extends AppEvent {
  final String subject;
  const AppDelete(this.subject);

  @override
  List<Object> get props => [subject];

  @override
  toString() => 'user Deleted {course Id: $subject}';

  @override
  bool? get stringify => true;
}
class AppGetfromScreen extends AppEvent {
  final Application app;
  const AppGetfromScreen(this.app);

  @override
  List<Object> get props => [app];
}

class AppEvaluation extends AppEvent {
  final String subject;
  final String seen;

 const AppEvaluation(this.subject,this.seen);
  @override
  List<Object> get props => [];
}