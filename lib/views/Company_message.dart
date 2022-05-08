import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynotes/models/applicationform.dart';
import 'package:mynotes/models/users.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:mynotes/repository/user_repo.dart';
import 'package:mynotes/views/reject_or_accept_application.dart';
import '../models/company.dart';

class Companymessage extends StatefulWidget {
  const Companymessage({Key? key}) : super(key: key);

  @override
  _CompanymessageState createState() => _CompanymessageState();
}

class _CompanymessageState extends State<Companymessage> {
  List<Application> characterList = <Application>[];

  void getCompaniesfromApi() async {
    CompanyApi.getapplication().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => Application.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    getCompaniesfromApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Column(children: [
              const Text(
                'InternSuit-Home',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 15),
              ),
              Flexible(
                  child: Container(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: characterList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(
          onTap: () {
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (context) {
                  return const ApplicationEvaluation();
                },
              ),
            );
          },
                            child: Card(
                              
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
                                        child: Text("From : ${characterList[index].userName}"),
                                      )
                                    ]),
                                  ],
                                )));
                          })))
            ])));
  }
}
