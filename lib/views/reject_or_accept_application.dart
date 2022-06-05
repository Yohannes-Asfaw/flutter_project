import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mynotes/models/applicationform.dart';
import 'package:http/http.dart' as http;
import 'package:mynotes/storage/localstorage.dart';

import '../application/blocs/app_bloc.dart';
import '../application/blocs/app_event.dart';
import '../application/blocs/app_state.dart';
import '../company/blocs/company_bloc.dart';

class ApplicationEvaluation extends StatefulWidget {
  const ApplicationEvaluation({ Key? key }) : super(key: key);

  @override
  State<ApplicationEvaluation> createState() => _ApplicationEvaluationState();
}

class _ApplicationEvaluationState extends State<ApplicationEvaluation> {
  @override
  Widget build(BuildContext context) {
   
        
        return Scaffold(
            appBar: AppBar(title: const Text("Application Evaluation"),
             toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,),  
            body:  BlocConsumer<AppBloc, AppState>(


                     listener: (context, state) {
                      print(state);
                      
                         if(state is AppEvaluationSucccess){
                                        AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.TOPSLIDE,
                                  title: 'Success',
                                  desc: 'message was sent to applicant',
                                  btnOkOnPress: () { 

                        context.go('/CompanyNavigation');
},
                                ).show();
                         }
 

                     },
              builder: (_, state) {
             
            
            
            if (state is AppgetfromScreenSucccess) {
              return Card(
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        
                                        Column(children: [
                                          Text(
                                            "${state.app.cgpa}",
                                            style: const TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20),
                                          ),
                                          Text(state.app.description),
                                        ])
                                      ],
                                    ),
                                    const Divider(
                                        indent: 5,
                                        endIndent: 5,
                                        thickness: 0.5,
                                        color: Colors.black),
                                    Column(children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        alignment: Alignment.centerLeft,
                                        child: const Text("company website"),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(state.app.Subject),
                                      )
                                    ]),
                                    ButtonBar(
                                      children: [
                                        OutlinedButton(
                                          child: const Text('Accept'),
                                          onPressed: () async { 
                                            String acc= "Accepted";
                                            String? id = await TokenStorage.getCompany();
                                     BlocProvider.of<AppBloc>(context).add(AppEvaluation(state.app.Subject,acc));

                          
                                       
                              
                                          },
                                          


                                        ),
                                        OutlinedButton(
                                          child: const Text('Reject'),
                                          onPressed: () async {
                                                  String rej= "Rejected";
                                     BlocProvider.of<AppBloc>(context).add(AppEvaluation(state.app.Subject,rej));
                                 
                              
                             
                               
                           
                              
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ));
            
            }return Center(child: CircularProgressIndicator(),)   ;   
                                
    }));
  }
}