import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/models/applicationform.dart';
import 'package:http/http.dart' as http;

class ApplicationEvaluation extends StatefulWidget {
  const ApplicationEvaluation({ Key? key }) : super(key: key);

  @override
  State<ApplicationEvaluation> createState() => _ApplicationEvaluationState();
}

class _ApplicationEvaluationState extends State<ApplicationEvaluation> {
  @override
  Widget build(BuildContext context) {
        final application = 
ModalRoute.of(context)!.settings.arguments as Application;
 
    return MaterialApp(
        title: "Application_Evaluation",
        
        home: Scaffold(
            appBar: AppBar(title: const Text("Application Evaluation"),
             toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,),  
            body: Card(
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        
                                        Column(children: [
                                          Text(
                                            application.userName,
                                            style: const TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20),
                                          ),
                                          Text(application.description),
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
                                        child: Text(application.department),
                                      )
                                    ]),
                                    ButtonBar(
                                      children: [
                                        OutlinedButton(
                                          child: const Text('Accept'),
                                          onPressed: () async { 
                                final response = await http.put(
                                Uri.parse('http://127.0.0.1:3000/put/application/${application.Subject}/Accepted'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                },
                                
                              ); 
                               if (response.statusCode==200) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.TOPSLIDE,
                                  title: 'Success',
                                  desc: 'Acceptance message was sent to applicant',
                                  btnOkOnPress: () {},
                                ).show();
                              }
                                          },
                                          


                                        ),
                                        OutlinedButton(
                                          child: const Text('Reject'),
                                          onPressed: () async {
                                final response = await http.put(
                                Uri.parse('http://127.0.0.1:3000/put/application/${application.Subject}/Rejected'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                }, );
                                if (response.statusCode==200) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.TOPSLIDE,
                                  title: 'Success',
                                  desc: 'Acceptance message was sent to applicant',
                                  btnOkOnPress: () {},
                                ).show();
                              }
                             
                               
                           
                              
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ))));
  }
}