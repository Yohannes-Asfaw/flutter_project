// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/application/application_repository/app_repository.dart';
import 'package:mynotes/application/blocs/app_bloc.dart';
import 'package:mynotes/auth/auth_repository.dart';
import 'package:mynotes/auth/login/data_provide/dataprovider.dart';
import 'package:mynotes/auth/login/login_bloc.dart';
import 'package:mynotes/post/blocs/post_bloc.dart';
import 'package:mynotes/post/blocs/post_state.dart';
import 'package:mynotes/post/data_provider/post_data_provider.dart';
import 'package:mynotes/post/post_repository/post_repository.dart';
import 'package:mynotes/user/blocs/user_bloc.dart';
import 'package:mynotes/user/data_provider/user_data_provider.dart';
import 'package:mynotes/user/repository/user_repository.dart';
import 'package:mynotes/views/application_form.dart';
import 'package:mynotes/views/companies_post.dart';
import 'package:mynotes/views/company_registration.dart';
import 'package:mynotes/views/companylogin.dart';
import 'package:mynotes/views/login.dart';
import 'package:go_router/go_router.dart';
import 'package:mynotes/views/user_registration.dart';
import 'application/dataprovider/app_provider.dart';
import 'company/blocs/company_bloc.dart';
import 'company/data_provider/company_data_provider.dart';
import 'company/repository/company_repository.dart';
import 'models/companies_post.dart';
import 'views/Company_message.dart';
import 'views/Usermessage.dart';
import 'views/company_navigation.dart';
import 'views/company_post.dart';
import 'views/company_profile.dart';
import 'views/postform.dart';
import 'views/reject_or_accept_application.dart';
import 'views/user_navigation.dart';
import 'views/user_profile.dart';




class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home:RepositoryProvider(
         create: (context)=>AuthenticationRepository(Loginprovider()),
         child: const CompaniesPost(),
       )
     );
    

  }
  }
   
 final _router = GoRouter(
   routes: [
     GoRoute(
       path: '/',
       builder: (context, state) => const CompanyLoginView(),
     ),
     GoRoute(
       path: '/SignupView',
       builder: (context, state) =>const  SignupView(),
     ),
     GoRoute(
       path: '/CompanySignupView',
       builder: (context, state) =>const  CompanySignupView(),
     ),
     GoRoute(
       path: '/ApplicationForm',
       builder: (context, state) =>const ApplicationForm(),
     ),
     GoRoute(
       path: '/companies_post',
       builder: (context, state) =>const CompaniesPost(),
     ),
     GoRoute(
       path: '/Companymessage',
       builder: (context, state) =>const  Companymessage(),
     ),
     GoRoute(
       path: '/CompanyNavigation',
       builder: (context, state) =>const  CompanyNavigation(),
     ),
     GoRoute(
       path: '/SingleCompaniesPost',
       builder: (context, state) =>const  SingleCompaniesPost(),
     ),
     GoRoute(
       path: '/CompanyProfile',
       builder: (context, state) =>const  CompanyProfile(),
     ),
     GoRoute(
       path: '/PostForm',
       builder: (context, state) =>const  PostForm(),
     ),
     GoRoute(
       path: '/ApplicationEvaluation',
       builder: (context, state) =>const  ApplicationEvaluation(),
     ),
     GoRoute(
       path: '/UserNavigation',
       builder: (context, state) =>const  UserNavigation(),
     ),
     GoRoute(
       path: '/UserProfile',
       builder: (context, state) =>const  UserProfile(),
     ),
     GoRoute(
       path: '/UserMessage',
       builder: (context, state) =>const  UserMessage(),
     ),

   ],
 );

void main() {
 runApp(
    MultiBlocProvider(
          providers: [
            BlocProvider<PostBloc>(
              create: (context) =>
            PostBloc(postRepository: PostRepository(PostDataProvider()))),
            BlocProvider<LoginBloc> (create: (context)=> LoginBloc(authrepo: AuthenticationRepository(Loginprovider())),)  ,
            BlocProvider<AppBloc> (create: (context)=> AppBloc(appRepository: AppRepository(AppDataProvider())),)   ,
            BlocProvider<CompanyBloc> (create: (context)=> CompanyBloc(companyRepository: CompanyRepository(CompanyDataProvider())),) , 
            BlocProvider<UserBloc> (create: (context)=> UserBloc(userRepository: UserRepository(UserDataProvider())),)     
   
  




  
            ],
          
          
      
     child: MaterialApp.router(
         routeInformationParser: _router.routeInformationParser,
         routerDelegate: _router.routerDelegate,
         
       ),
   )
 );
}



