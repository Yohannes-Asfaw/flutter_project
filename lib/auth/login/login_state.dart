import 'package:equatable/equatable.dart';
import 'package:mynotes/models/company.dart';

import '../../models/users.dart';

class LoginState extends Equatable{
  const LoginState();
   
  @override
  List<Object?> get props => [];
  }
class LoginLoading extends LoginState {}

class LoginFilure extends LoginState{
  final Object error;
  
  const LoginFilure(this.error);
  @override
  List<Object> get props => [error];

}
class CompanyLoginSuccess extends LoginState{
  final Company company;
       const CompanyLoginSuccess(this.company);
  @override
  List<Object> get props => [company];

}
class UserLoginSuccess extends LoginState{
  final  User user;
       const UserLoginSuccess(this.user);
  @override
  List<Object> get props => [user];

}
