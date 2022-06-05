import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mynotes/application/blocs/app_event.dart';
import 'package:mynotes/models/applicationform.dart';
import 'package:mynotes/models/users.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:mynotes/repository/user_repo.dart';
import 'package:mynotes/views/reject_or_accept_application.dart';
import '../application/blocs/app_bloc.dart';
import '../application/blocs/app_state.dart';
import '../auth/login/login_bloc.dart';
import '../models/company.dart';
import '../storage/localstorage.dart';

class Companymessage extends StatefulWidget {
  const Companymessage({Key? key}) : super(key: key);
   
  @override
  _CompanymessageState createState() => _CompanymessageState();
}

class _CompanymessageState extends State<Companymessage> {
  List<Application> characterList = <Application>[];
  
  // getcompanyname() async {
  //   var token = await TokenStorage.getCompanyToken('company_token');
  //   Map<String, dynamic> payload =  Jwt.parseJwt(token.toString());
  //   String companyname =  payload.values.toList()[2];
  //   return companyname;}

    
  @override
  void initState()  {
    
    // getCompaniesfromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context); 
        
        return Scaffold(
            appBar: AppBar(title: const Text("Message"),
             toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,), 
      body:  BlocBuilder<AppBloc, AppState>(
                     builder: (_, state) {
                       
                       
        
                      
                       
        print(state);
        if (state is GetByComoanynameFetchSuccess ) {
        final AppList = state.apps;

        return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Column(children: [
       
              Flexible(
                  child: Container(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: AppList.length,
                          itemBuilder: (context, index) {
           
                            return Card(
                              
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    const Divider(
                                        indent: 5,
                                        endIndent: 5,
                                        thickness: 0.5,
                                        color: Colors.black),
                                    Column(children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        alignment: Alignment.centerLeft,
                                        child: const Text("user application"),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text("From : ${AppList.elementAt(index).user.userName}"),
                                      ),       ButtonBar(
                                      children: [
                                        OutlinedButton(
                                          child: const Text('Detail'),
                                          onPressed: () {
                                              BlocProvider.of<AppBloc>(context).add(AppGetfromScreen(AppList.elementAt(index)));
       context.go('/ApplicationEvaluation');
                             
                                       
                                          },
                                        )
                                      ],
                                    )
                                    ]),
                                  ],
                                ));
                          })))
            ]));
  }
  return Center(child: CircularProgressIndicator(),);
  }));
  }
}
