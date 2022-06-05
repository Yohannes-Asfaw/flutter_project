import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/auth/auth_repository.dart';
import 'package:mynotes/models/company.dart';

import '../../models/users.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final AuthenticationRepository authrepo;
  LoginBloc({required this.authrepo}):super(LoginLoading()){
     on<AttemptLogin>((event, emit) async{
    try {
        final  User user = await authrepo.login(event.username,event.password);
        emit(UserLoginSuccess(user));
      } catch (error) {
        emit(LoginFilure(error));
      }

  
    });
    on<CompanyAttemptLogin>((event, emit) async{
    try {
        Company  company = await authrepo.companylogin(event.companyname,event.password);
        emit(CompanyLoginSuccess(company));
      } catch (error) {
        emit(LoginFilure(error));
      }

  
    });

    
  
   
}

  }