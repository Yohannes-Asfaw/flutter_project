import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/models/applicationform.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:mynotes/repository/user_repo.dart';
import 'package:mynotes/views/reject_or_accept_application.dart';

import '../application/blocs/app_bloc.dart';
import '../application/blocs/app_state.dart';

class UserMessage extends StatefulWidget {
  const UserMessage({Key? key}) : super(key: key);

  @override
  _UserMessageState createState() => _UserMessageState();
}

class _UserMessageState extends State<UserMessage> {
  

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notification"),
          toolbarHeight: 50,
          backgroundColor: Colors.teal,
          elevation: 10,
        ),
        body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            print(state);
           if (state is AppFetchByUserIdSuccess){
          final characterList=state.apps;
          
            return Column(children: [
              Flexible(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: characterList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 5,
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Company response",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.teal),
                                  ),
                                ),
                                const Divider(
                                    indent: 5,
                                    endIndent: 5,
                                    thickness: 0.5,
                                    color: Colors.black),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "From : ${characterList[index].company.companyname} company",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Dear : ${characterList[index].user} you Application was to our company ${characterList[index].Seen}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                if (characterList[index].Seen == "Accepted")
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      "come to our office or contact us via email",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                              ],
                            ));
                      }))
            ]);
          }return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
