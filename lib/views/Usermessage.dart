import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynotes/models/applicationform.dart';
import 'package:mynotes/repository/companies_repo.dart';
import 'package:mynotes/repository/user_repo.dart';
import 'package:mynotes/views/reject_or_accept_application.dart';

class UserMessage extends StatefulWidget {
  const UserMessage({Key? key}) : super(key: key);

  @override
  _UserMessageState createState() => _UserMessageState();
}

class _UserMessageState extends State<UserMessage> {
  List<Application> characterList = <Application>[];

  void getmessagefromApi() async {
    UserApi.getmessage().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => Application.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    getmessagefromApi();

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
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Column(children: [
              Flexible(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: characterList.length,
                      itemBuilder: (context, index) {
                        return  
                         Card(
                           elevation: 5,
                                shadowColor: Colors.black,
                                borderOnForeground: true,
                                margin: const EdgeInsets.only(top: 10),
                          
                            child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    alignment: Alignment.centerLeft,
                                    child: const Text("Company response",style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'DancingScript',
                              color: Colors.teal),),
                                  ),
                                  const Divider(
                                    indent: 5,
                                    endIndent: 5,
                                    thickness: 0.5,
                                    color: Colors.black),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text("From : ${characterList[index].company_name} company",style:const TextStyle(
                              fontSize: 20,
                              fontFamily: 'DancingScript',
                              color: Colors.teal),),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Dear : ${characterList[index].user.userName} you Application was to our company ${characterList[index].Seen}",style:const TextStyle(
                              fontSize: 20,
                              fontFamily: 'DancingScript',
                              color: Colors.teal),),
                                  ),
                              if(characterList[index].Seen=="Accepted")
                                Container(
                                    padding: const EdgeInsets.all(5.0),
                                    alignment: Alignment.centerLeft,
                                    child: const Text("come to our office or contact us via email",style:TextStyle(
                              fontSize: 20,
                              fontFamily: 'DancingScript',
                              color: Colors.teal),),
                                  ),

                                ],
                              
                            ));
                      }))
            ])));
  }
}
