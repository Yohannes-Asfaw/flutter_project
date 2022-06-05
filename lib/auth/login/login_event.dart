import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
    
const LoginEvent();
}
class AttemptLogin extends LoginEvent{
  final String username;
  final String password;
  const AttemptLogin(this.username, this.password);

  @override
  List<Object?> get props => [];
   @override
  String toString() => 'successfuly logedin as $username';
  
}
class CompanyAttemptLogin extends LoginEvent{
  final String companyname;
  final String password;
  const CompanyAttemptLogin(this.companyname, this.password);

  @override
  List<Object?> get props => [];
   @override
  String toString() => 'successfuly logedin as $companyname';
  
}
