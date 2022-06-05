import 'package:equatable/equatable.dart';

import '../../models/users.dart';

abstract class UserEvent extends Equatable {

  const UserEvent();
   @override
  List<Object> get props => [];
}
class FetchByuserName extends UserEvent {
  final String userName;


  const FetchByuserName(this.userName);

  @override
  List<Object>  get props => [userName];

  @override
  String toString() => 'user accessed: $userName';
}



class UserCreate extends UserEvent {
  final User user;

  const UserCreate(this.user);

  @override
 List<Object>  get props => [user];

  @override
  String toString() => 'user Created {course Id: ${user.userName}}';
}

class UserUpdate extends UserEvent {
  final String userName;
  final User user;

  const UserUpdate(this.userName, this.user);

  @override
  List<Object>  get props => [userName,user ];

  @override
  String toString() => 'user Updated {course Id: ${user.userName}}';
}

class UserDelete extends UserEvent {
  final String userName;
  const UserDelete(this.userName);

  @override
  List<Object> get props => [userName];

  @override
  toString() => 'user Deleted {course Id: $userName}';

  @override
  bool? get stringify => true;
}
